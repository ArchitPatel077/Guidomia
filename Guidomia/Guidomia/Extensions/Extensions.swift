//
//  Extensions.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-05.
//

import Foundation
import UIKit

extension NSAttributedString {
    
     func bulletPoints() -> NSAttributedString {
        var attributes = [NSAttributedString.Key: AnyObject]()
        attributes[.foregroundColor] = UIColor(named: "carOrangeColor")
        attributes[.font] = UIFont.systemFont(ofSize: 15, weight: .heavy)
        let attributedString = NSAttributedString(string:  "•  ", attributes: attributes)
        return attributedString
    }
    
    
    func displayBulletedText(for carList:[String]) -> NSAttributedString {
        let bullet = NSAttributedString().bulletPoints()
        
        let attributes = NSMutableAttributedString()
        carList.forEach {
            attributes.append(bullet)
            attributes.append(NSAttributedString(string: $0))
            attributes.append(NSAttributedString(string: "\n"))
        }
        
        let finalList = NSMutableAttributedString()
        finalList.append(attributes)
        return finalList.lineSpacing(spacing: 5)
    }
    
    func lineSpacing(spacing: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byTruncatingTail
        style.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle, value: style,
                                      range: NSRange(location: 0, length: string.count))
        return NSAttributedString(attributedString: attributedString)
    }
}

