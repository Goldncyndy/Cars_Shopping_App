//
//  ExploreCarsModel.swift
//  CarsShoppingApp
//
//  Created by Decagon on 14/02/2022.
//

import Foundation

class ExploreCards {
  let productName: String
  let productBrand: String
  let productRating: String
  let price: String
  let imageName: String

  init(productName: String, productBrand: String, productRating: String, price: String, imageName: String){
        self.productName = productName
        self.productBrand = productBrand
        self.productRating = productRating
        self.price = price
        self.imageName = imageName
    }
}
