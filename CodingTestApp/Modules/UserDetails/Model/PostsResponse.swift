//
//  PostsResponse.swift
//  CodingTestApp
//
//  Created by Nilay on 25/08/23.
//

import Foundation

struct PostsResponse : Codable, Hashable {
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?
}
