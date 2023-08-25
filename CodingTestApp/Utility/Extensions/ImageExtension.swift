//
//  ImageExtension.swift
//  CodingTestApp
//
//  Created by Nilay on 25/08/23.
//

import Foundation
import UIKit

extension UIImage {
    class func createInitialsImage(name: String, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        // Draw a circle background
        let circlePath = UIBezierPath(ovalIn: CGRect(origin: .zero, size: size))
        context.setFillColor(UIColor.lightGray.cgColor) // Set your preferred background color
        context.addPath(circlePath.cgPath)
        context.fillPath()
        
        // Draw the initials
        let initials = name
               .components(separatedBy: " ")
               .compactMap { $0.first }
               .prefix(2)
               .map { String($0) } // Convert Character to String
               .joined()
               .uppercased()
        let textFontAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: size.width * 0.4), // Adjust font size
            .foregroundColor: UIColor.white
        ]
        let textSize = initials.size(withAttributes: textFontAttributes)
        let textRect = CGRect(x: (size.width - textSize.width) / 2, y: (size.height - textSize.height) / 2, width: textSize.width, height: textSize.height)
        initials.draw(in: textRect, withAttributes: textFontAttributes)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
