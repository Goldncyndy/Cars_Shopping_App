//
//  CarDetailViewController.swift
//  CarsShoppingApp
//
//  Created by Decagon on 14/02/2022.
//

import UIKit

class CarDetailViewController: UIViewController {
 
  var result : Result?
  
  // MARK: - TIME LABEL TO DISPLAY THE PAGE TITLE
  lazy var titlePageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Product"
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - EXPLORE IMAGE ICON
  lazy var backButton: UIButton = {
    let button = UIButton()
    button.setBackgroundImage(UIImage(named: "back"), for: .normal)
    button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  // MARK: - CART BUTTON ICON FOR NOTIFICATION
  lazy var cartIcon: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Cart-Icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PRODUCT NAME
  lazy var productNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Product Name"
    label.font = UIFont.boldSystemFont(ofSize: 25)
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PRODUCT NAME
  let productNametextView: UILabel = {
    let textView = UILabel()
    textView.text = "Product Name"
    textView.font = UIFont.boldSystemFont(ofSize: 18)
    textView.font = UIFont(name: "NunitoSans-Bold", size: 18)
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PRODUCT BRAND
  let productBrandTextView: UILabel = {
    let textView = UILabel()
    textView.text = "Brand"
    textView.font = UIFont.boldSystemFont(ofSize: 13)
    textView.font = UIFont(name: "NunitoSans-Regular", size: 13)
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PRODUCT RATE LABEL
  let productRateLabel: UILabel = {
    let textView = UILabel()
    textView.text = "(5.0)"
    textView.font = UIFont(name: "NunitoSans-Regular", size: 14)
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PRODUCT IMAGE
  let productRateView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    imageView.image = UIImage(named: "star")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PRODUCT PRICE
  let productPriceTextView: UILabel = {
    let textView = UILabel()
    textView.text = "$111.67"
    textView.font = UIFont.boldSystemFont(ofSize: 14)
    textView.font = UIFont(name: "NunitoSans-Semibold", size: 14)
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PRODUCT IMAGE VIEW
  let productImageV: UIImageView = {
    let view = UIImageView()
    view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.97, alpha: 1.00)
    view.contentMode = .scaleAspectFit
    view.layer.cornerRadius = 20
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PRODUCT DETAILS NAME
  let productDetailsView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - TIME LABEL TO DISPLAY THE TOTAL PRODUCT PRICE
  let totalPriceTextView: UILabel = {
    let textView = UILabel()
    textView.text = "Total: $300.00"
    textView.font = UIFont.boldSystemFont(ofSize: 14)
    textView.font = UIFont(name: "NunitoSans-Semibold", size: 14)
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PRODUCT DETAILS NAME
  let purchaseView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 25
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PURCHASE BUTTON
  lazy var purchaseBigButton: UIButton = {
    let button = UIButton()
    button.layer.cornerRadius = 12
    button.backgroundColor = .black
    button.setTitleColor(.yellow, for: .normal)
    button.setTitle("Add to cart", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  // MARK: - TIME LABEL TO DISPLAY THE PURCHASE BUTTON
  lazy var purchaseButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .black
    button.layer.cornerRadius = 12
    button.setTitleColor(.yellow, for: .normal)
    button.setTitle("$150.00", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  var productName = ""
  var productBrand = ""
  var productPrice = ""
  var productImage = UIImage()
  
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
        self!.productImageV.image = image!
      }
    }.resume()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    productNameLabel.text = productName
    productNametextView.text = productName
    productBrandTextView.text = productBrand
    productPriceTextView.text = productPrice
    navigationController?.navigationBar.isHidden = true
    setupConstraints()
  }
  
  // MARK: - SETUP VIEWS FUNCTION
  func addDefaultViews() {
    view.addSubview(titlePageLabel)
    view.addSubview(backButton)
    view.addSubview(cartIcon)
    view.addSubview(productNameLabel)
    view.addSubview(productDetailsView)
    view.addSubview(purchaseView)
    purchaseView.addSubview(purchaseBigButton)
    purchaseView.addSubview(totalPriceTextView)
    productDetailsView.addSubview(productNametextView)
    productDetailsView.addSubview(productImageV)
    productDetailsView.addSubview(productRateLabel)
    productDetailsView.addSubview(productRateView)
    productDetailsView.addSubview(productPriceTextView)
    productDetailsView.addSubview(productBrandTextView)
    productDetailsView.addSubview(purchaseButton)
  }
  
  @objc func didTapTopBackArrowButton() {
    navigationController?.popViewController(animated: true)
  }
  // MARK: - FUNCTION TO SETUP VIEW CONSTRAINTS
  func setupConstraints() {
    addDefaultViews()
    NSLayoutConstraint.activate([
      //MARK: - CONSTRAINTS FOR EXPLORE ICON
      backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      backButton.heightAnchor.constraint(equalToConstant: 25),
      backButton.widthAnchor.constraint(equalToConstant: 25),
      //MARK: - CONSTRAINTS FOR PAGETITLE LABEL
      titlePageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      titlePageLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 40),
      //MARK: - CONSTRAINTS FOR PAGETITLE LABEL
      cartIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      cartIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      cartIcon.heightAnchor.constraint(equalToConstant: 30),
      cartIcon.widthAnchor.constraint(equalToConstant: 30),
      // MARK: - CONSTRAINTS FOR PRODUCT NAME LABEL
      productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      productNameLabel.topAnchor.constraint(equalTo: titlePageLabel.bottomAnchor, constant: 30),
      //MARK: - CONSTRAINTS FOR PRODUCT DETAILS VIEW
      productDetailsView.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 100),
      productDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      productDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      productDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
      //MARK: - CONSTRAINTS FOR PRODUCT IMAGE VIEW
      productImageV.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 40),
      productImageV.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 20),
      productImageV.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
      productImageV.bottomAnchor.constraint(equalTo: productDetailsView.bottomAnchor, constant: -150),
      //MARK: - CONSTRAINTS FOR PRODUCT NAME DETAILS
      productNametextView.topAnchor.constraint(equalTo: productImageV.bottomAnchor, constant: 40),
      productNametextView.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 20),
      //MARK: - CONSTRAINTS FOR PRODUCT BRAND DETAILS
      productBrandTextView.topAnchor.constraint(equalTo: productNametextView.bottomAnchor, constant: 10),
      productBrandTextView.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 20),
      //MARK: - CONSTRAINTS FOR PRODUCT PRICE DETAILS
      productPriceTextView.topAnchor.constraint(equalTo: productBrandTextView.bottomAnchor, constant: 10),
      productPriceTextView.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 20),
      //MARK: - CONSTRAINTS FOR PRODUCT RATE VIEW
      productRateView.topAnchor.constraint(equalTo: productImageV.bottomAnchor, constant: 40),
      productRateView.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -60),
      productRateView.heightAnchor.constraint(equalToConstant: 25),
      productRateView.widthAnchor.constraint(equalToConstant: 25),
      //MARK: - CONSTRAINTS FOR PRODUCT RATE LABEL
      productRateLabel.topAnchor.constraint(equalTo: productImageV.bottomAnchor, constant: 40),
      productRateLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
      //MARK: - CONSTRAINTS FOR PRODUCT PURCHASE BUTTON
      purchaseButton.topAnchor.constraint(equalTo: productRateView.bottomAnchor, constant: 10),
      purchaseButton.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
      purchaseButton.heightAnchor.constraint(equalToConstant: 40),
      purchaseButton.widthAnchor.constraint(equalToConstant: 100),
      
      purchaseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      purchaseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      purchaseView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
      purchaseView.heightAnchor.constraint(equalToConstant: 150),
      
      purchaseBigButton.leadingAnchor.constraint(equalTo: purchaseView.leadingAnchor, constant: 20),
      purchaseBigButton.trailingAnchor.constraint(equalTo: purchaseView.trailingAnchor, constant: -20),
      purchaseBigButton.bottomAnchor.constraint(equalTo: purchaseView.bottomAnchor, constant: -30),
      purchaseBigButton.heightAnchor.constraint(equalToConstant: 50),
      
      totalPriceTextView.topAnchor.constraint(equalTo: purchaseView.topAnchor, constant: 20),
      totalPriceTextView.trailingAnchor.constraint(equalTo: purchaseView.trailingAnchor, constant: -20)
    ])
  }

}
