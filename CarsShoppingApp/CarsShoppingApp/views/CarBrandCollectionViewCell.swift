//
//  CarBrandCollectionViewCell.swift
//  CarsShoppingApp
//
//  Created by Decagon on 14/02/2022.
//

import UIKit
import SVGKit

class CarBrandCollectionViewCell: UICollectionViewCell {
  static let identifier = "BrandCollectionViewCell"
  
  var items: [ExploreBrand] = []
  
  let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius =  imageView.frame.size.height/2
    return imageView
  }()
  let brandName: UILabel = {
    let text = UILabel()
    text.font = UIFont(name: "Helvetica", size: 13)
    text.numberOfLines = 0
    text.translatesAutoresizingMaskIntoConstraints = false
    return text
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpViews()
  }
  func setUpViews() {
    addSubview(brandName)
    addSubview(productImageView)
    productImageView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: brandName.bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 20, rightConstant: 0)
    brandName.anchorWithConstantsToTop(top: productImageView.topAnchor, left: leftAnchor,
                                       bottom: bottomAnchor,
                                       right: rightAnchor,
                                       topConstant: 50,
                                       leftConstant: 11,
                                       bottomConstant: 0, rightConstant: -10)
    brandName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func configure(with urlString: String){
    guard let url = URL(string: urlString) else {
      return
      
    }
    URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let data = data , error == nil else {
        return
      }
      DispatchQueue.main.async {
        print(data)
        
        guard let image: SVGKImage = SVGKImage(contentsOf: url) else {
          return
        }
        self?.productImageView.image = image.uiImage
        guard let img  = UIImage(data: data) else { return }
        self?.productImageView.image = img
        
      }
    }.resume()
  }
}
