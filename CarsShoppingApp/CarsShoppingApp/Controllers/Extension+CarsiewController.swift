//
//  Extension+CarsiewController.swift
//  CarsShoppingApp
//
//  Created by Decagon on 14/02/2022.
//

import UIKit

extension CarsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == brandCollectionView {
      return 10
    }
    else {
      return 15
    }
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if collectionView == brandCollectionView {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CarBrandCollectionViewCell else { return UICollectionViewCell() }
      dataLoader.pullJSONData { data in
        self.cars = data
        let imageUrlString = self.cars?.makeList[indexPath.item].imageUrl ?? ""
        let url = URL(string: self.cars?.makeList[indexPath.item].imageUrl ?? "")
        
        DispatchQueue.main.async {
          cell.configure(with: imageUrlString)
          cell.brandName.text = self.cars?.makeList[indexPath.item].name
          cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
          cell.layer.cornerRadius = cell.frame.size.height/2
        }
      }
      return cell
    } else {
      
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productId, for: indexPath) as? AvailableCarsCollectionViewCell else { return UICollectionViewCell() }
      let url = URL(string: self.list?.result[indexPath.item].imageUrl ?? "")
      dataLoader.pullListJSONData { data in
        self.list = data
        let imageUrlString = self.list?.result[indexPath.item].imageUrl ?? ""
        
        DispatchQueue.main.async {
          cell.configure(with: imageUrlString)
          cell.productNametextView.text =   self.list?.result[indexPath.item].title
          cell.productBrandTextView.text =  self.list?.result[indexPath.item].sellingCondition
          cell.productPriceTextView.text = self.list?.result[indexPath.item].mileageUnit
          
        }
      }
      return cell
    }
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView  == brandCollectionView {
      return CGSize(width: 60, height: 60)
    } else {
      return CGSize(width: view.frame.width, height: 350)
    }
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if collectionView == productCollectionView {
      let viewController = CarDetailViewController()
      viewController.productName = (list?.result[indexPath.row].title) ?? ""
      viewController.productBrand = (list?.result[indexPath.row].sellingCondition) ?? ""
      viewController.productPrice = (list?.result[indexPath.row].state) ?? ""
      viewController.configure(with: (list?.result[indexPath.row].imageUrl) ?? "")
      navigationController?.pushViewController(viewController, animated: true)
    }
  }
  class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
  }
}
