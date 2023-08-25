//
//  AddressModel.swift
//  CodingTestApp
//
//  Created by deq on 25/08/23.
//

import Foundation
struct Address : Codable {
    let street : String?
    let suite : String?
    let city : String?
    let zipcode : String?
    let geo : Geo?
}
