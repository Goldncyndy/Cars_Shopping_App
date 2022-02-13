//
//  AvailableCarsCollectionViewCell.swift
//  CarsShoppingApp
//
//  Created by Decagon on 14/02/2022.
//

import UIKit

class AvailableCarsCollectionViewCell: UICollectionViewCell {
  static let identifier = "ExploreCollectionViewCell"
  
  var cards: [ExploreCards] = []
  
  let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 20
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  let productNametextView: UILabel = {
    let textView = UILabel()
    textView.text = "Product Name"
    textView.font = UIFont.boldSystemFont(ofSize: 18)
    textView.font = UIFont(name: "NunitoSans-Bold", size: 18)
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  let productBrandTextView: UILabel = {
    let textView = UILabel()
    textView.text = "Brand"
    textView.font = UIFont.boldSystemFont(ofSize: 13)
    textView.font = UIFont(name: "NunitoSans-Regular", size: 13)
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  let productRateLabel: UILabel = {
    let textView = UILabel()
    textView.text = "(5.0)"
    textView.font = UIFont(name: "NunitoSans-Regular", size: 14)
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  let productRateView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    imageView.image = UIImage(named: "star")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  let productPriceTextView: UILabel = {
    let textView = UILabel()
    textView.text = "$111.67"
    textView.font = UIFont.boldSystemFont(ofSize: 14)
    textView.font = UIFont(name: "NunitoSans-Semibold", size: 14)
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  let productImageV: UIImageView = {
    let view = UIImageView()
    view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.97, alpha: 1.00)
    view.contentMode = .scaleAspectFit
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let productDetailsView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  lazy var addButton: UIButton = {
    let button = UIButton()
    button.layer.cornerRadius = 17
    button.backgroundColor = .black
    button.setTitleColor(.yellow, for: .normal)
    button.setTitle("+", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpViews()
    
  }
  func setUpViews() {
    productDetailsView.addSubview(productNametextView)
    productDetailsView.addSubview(productBrandTextView)
    productDetailsView.addSubview(productPriceTextView)
    productDetailsView.addSubview(productRateView)
    productDetailsView.addSubview(productRateLabel)
    addSubview(productImageV)
    addSubview(productDetailsView)
    addSubview(addButton)
    addSubview(productImageView)
    productDetailsView.addSubview(productImageV)
    
    productImageView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    
    productDetailsView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom:bottomAnchor, right: rightAnchor, topConstant: 80, leftConstant: 20, bottomConstant: 0, rightConstant: 20)
    
    productImageV.anchorWithConstantsToTop(top: topAnchor, left:  leftAnchor, bottom: productDetailsView.bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: 35, bottomConstant: 100, rightConstant: 35)
    
    productNametextView.anchorWithConstantsToTop(top: productImageV.bottomAnchor, left: leftAnchor,
                                                 bottom: bottomAnchor,right: rightAnchor,topConstant: 0,leftConstant: 50,
                                                 bottomConstant: 60, rightConstant: 0)
    productBrandTextView.anchorWithConstantsToTop(top: productNametextView.bottomAnchor, left: leftAnchor,
                                                  bottom: bottomAnchor,right: rightAnchor,topConstant: 0,leftConstant: 50,
                                                  bottomConstant: 40, rightConstant: 0)
    productPriceTextView.anchorWithConstantsToTop(top: productBrandTextView.bottomAnchor, left: leftAnchor,
                                                  bottom: bottomAnchor,right: rightAnchor,topConstant: 0,leftConstant: 50,
                                                  bottomConstant: 0, rightConstant: 0)
    productRateView.anchorWithConstantsToTop(top: productBrandTextView.bottomAnchor, left: leftAnchor,
                                             bottom: bottomAnchor,right: rightAnchor,topConstant: 0,leftConstant: 300,
                                             bottomConstant: 70, rightConstant: 0)
    productRateView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
    productRateView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
    addButton.anchorWithConstantsToTop(top: productRateView.bottomAnchor, left: leftAnchor,
                                       bottom: bottomAnchor,right: rightAnchor,topConstant: 0,leftConstant: 330,
                                       bottomConstant: 20, rightConstant: 0)
    addButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
    addButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1).isActive = true
    
    NSLayoutConstraint.activate([
      productRateLabel.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -12),
      productRateLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -30)
    ])
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
        let image = UIImage(data: data)
        self?.productImageV.image = image
        
      }
    }.resume()
  }
}

extension UIView {
  func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
    anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
  }
  func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                                bottom: NSLayoutYAxisAnchor? = nil,
                                right: NSLayoutXAxisAnchor? = nil,
                                topConstant: CGFloat = 0,
                                leftConstant: CGFloat = 0,
                                bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
    }
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
    }
    if let left = left {
      leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
    }
    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
    }
  }
}
