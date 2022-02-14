//
//  CarsViewController.swift
//  CarsShoppingApp
//
//  Created by Decagon on 13/02/2022.
//

import UIKit
import SVGKit

class CarsViewController: UIViewController {

  var data = DataLoader()
  var cards: [ExploreCards] = []
  let dataLoader = DataLoader()
  var cars: Json4Swift_Base?
  var list: Welcome?
  
  // MARK: - DISPLAY THE PAGE TITLE
  lazy var titlePageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Explore"
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - CREATING THE EXPLORE ICON
  lazy var exploreIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Explore-Image-Icon")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - CREATING CART ICON FOR NOTIFICATION
  lazy var cartIcon: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Cart-Icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  //MARK: // CREATING THE SEARCH BAR
  let searchBar: LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.layer.borderColor = UIColor.black.cgColor
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    textField.layer.borderWidth = 0
    textField.placeholder = "☌ Search"
    textField.autocapitalizationType = .none
    textField.layer.cornerRadius = 10
    return textField
  }()
  // MARK: - CREATING FILTER BUTTON SEARCHBAR
  lazy var searchButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Filter-Button"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  // MARK: - CREATING CARS BRAND COLLECTION VIEW
  lazy var brandCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 25
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  .white
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isUserInteractionEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  // MARK: - CREATING CARS COLLECTION VIEW
  lazy var productCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 30
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isUserInteractionEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  let cellId = "cellId"
  let productId = "productId"
  override func viewDidLoad() {
    super.viewDidLoad()
    data.pullJSONData { [weak self] data in
      guard self != nil else { return }
      print(data)
    }
    navigationController?.navigationBar.isHidden = true
    view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    productCollectionView.register(AvailableCarsCollectionViewCell.self, forCellWithReuseIdentifier: "productId")
    brandCollectionView.register(CarBrandCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    setupConstraints()
    productCollectionView.showsHorizontalScrollIndicator = false
    productCollectionView.showsVerticalScrollIndicator = false
  }
  // MARK: - SETUP VIEWS FUNCTION
  func addDefaultViews() {
    view.addSubview(titlePageLabel)
    view.addSubview(exploreIcon)
    view.addSubview(cartIcon)
    view.addSubview(searchButton)
    view.addSubview(productCollectionView)
    view.addSubview(brandCollectionView)
    view.addSubview(searchBar)
  }
  // MARK: - FUNCTION TO SETUP VIEW CONSTRAINTS
  func setupConstraints() {
    addDefaultViews()
    NSLayoutConstraint.activate([
      //MARK: - CONSTRAINTS FOR EXPLORE ICON
      exploreIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      exploreIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      exploreIcon.heightAnchor.constraint(equalToConstant: 27),
      exploreIcon.widthAnchor.constraint(equalToConstant: 27),
      //MARK: - CONSTRAINTS FOR PAGETITLE LABEL
      titlePageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      titlePageLabel.leadingAnchor.constraint(equalTo: exploreIcon.trailingAnchor, constant: 20),
      //MARK: - CONSTRAINTS FOR PAGETITLE LABEL
      cartIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      cartIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      cartIcon.heightAnchor.constraint(equalToConstant: 25),
      cartIcon.widthAnchor.constraint(equalToConstant: 25),
      //MARK: - CONSTRAINTS FOR SEARCH BAR
      searchBar.topAnchor.constraint(equalTo: cartIcon.bottomAnchor, constant: 20),
      searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      searchBar.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -10),
      searchBar.bottomAnchor.constraint(equalTo: brandCollectionView.topAnchor, constant: -5),
      searchBar.heightAnchor.constraint(equalToConstant: 50),
      //MARK: - CONSTRAINTS FOR SEARCH BUTTON
      searchButton.topAnchor.constraint(equalTo: cartIcon.bottomAnchor, constant: 20),
      searchButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 10),
      searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      searchButton.heightAnchor.constraint(equalToConstant: 50),
      searchButton.widthAnchor.constraint(equalToConstant: 50),
      
      brandCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
      brandCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      brandCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      brandCollectionView.heightAnchor.constraint(equalToConstant: 110),
      //brandCollectionView.widthAnchor.constraint(equalToConstant: 50),
      
      productCollectionView.topAnchor.constraint(equalTo: brandCollectionView.bottomAnchor, constant: 20),
      productCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      productCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      productCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
      //productCollectionView.heightAnchor.constraint(equalToConstant: 80),
    ])
  
  }
}

