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
  //MARK: CREATING CARS IMAGEVIEW
  let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius =  imageView.frame.size.height/2
    return imageView
  }()
  //MARK: CREATING CARS BRANDNAME LABEL
  let brandName: UILabel = {
    let text = UILabel()
    text.font = UIFont(name: "Helvetica", size: 13)
    text.numberOfLines = 0
    text.textAlignment = .natural
    text.translatesAutoresizingMaskIntoConstraints = false
    return text
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpViews()
  }
  //MARK: ADDING AND LAYING OUT THE VIEWS ON THE SCREEN
  func setUpViews() {
    addSubview(brandName)
    addSubview(productImageView)
    //MARK: ADDING AND LAYOUT TO THE IMAGE VIEW
    productImageView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: brandName.bottomAnchor, right: rightAnchor, topConstant: 6, leftConstant: 0, bottomConstant: 30, rightConstant: 0)
    //MARK: ADDING AND LAYOUT TO BRANDNAME
    brandName.topAnchor.constraint(equalTo: productImageView.topAnchor, constant: 65).isActive = true
    brandName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
    brandName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func configure(with urlString: String){
    guard let url = URL(string: urlString) else {
      return
      
    }
    //MARK: CREATING A URLSESSION FOR SVGIMAGES AND CHECKING FOR OTHER IMAGE TYPES
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
