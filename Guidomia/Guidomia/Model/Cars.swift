//
//  Cars.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-05.
//

import UIKit

struct Cars: Codable {
    
    var consList: [String]
    var customerPrice: Double
    var make: String
    var marketPrice: Double
    var model: String
    var prosList: [String]
    var rating: Int
    
    func carImage() -> UIImage {
        
        switch CarImages(rawValue: make) {
        case .rangeRover:
            return CarImages.rangeRover.carImage
        case .alpine:
            return CarImages.alpine.carImage
        case .bmw :
            return CarImages.bmw.carImage
        case .mercedes:
            return CarImages.mercedes.carImage
        default:
            return UIImage()
        }
    }
    
    func carName() -> String {
        return make + " " + model
    }
    
    func carPrice() -> String {
        return "Price: " + String(customerPrice/1000) + "k"
    }
    
    func carRating() -> String {
        var star = "★"
        let space = "" + star
        for _ in 1..<rating {
            star.append(space)
        }
        return star
    }
}
