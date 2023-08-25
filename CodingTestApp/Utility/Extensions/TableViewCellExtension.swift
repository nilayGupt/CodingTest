//
//  TableViewCellExtension.swift
//  CodingTestApp
//
//  Created by deq on 25/08/23.
//

import Foundation
import UIKit

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
    
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    static var nib: UINib? {
        UINib(nibName: String(describing: self), bundle: nil)
    }
    
}

