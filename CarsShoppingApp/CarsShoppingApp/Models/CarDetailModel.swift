//
//  CarDetailModel.swift
//  CarsShoppingApp
//
//  Created by Decagon on 14/02/2022.
//

import Foundation

// MARK: - Welcome
struct CarDetails: Codable {
    let error: String
    let code: Int
    let message: String
    let details: [Detail]
}

// MARK: - Detail
struct Detail: Codable {
//    let typeURL: String
    let value: String
}
