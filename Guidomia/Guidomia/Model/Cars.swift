//
//  Cars.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-05.
//

import UIKit

struct CarsMakeAndModel: Codable {
    var make: String
    var model: String
    func carList() -> String {
        return make
    }
}

struct Cars: Codable {
    
    var consList: [String]
    var customerPrice: Double
    var make: String
    var marketPrice: Double
    var model: String
    var prosList: [String]
    var rating: Int
    
    // Method to display images
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
    
    // Method to display car name
    func carName() -> String {
        return make + " " + model
    }
    
    // Method to display car price
    func carPrice() -> String {
        return "Price: " + String(customerPrice/1000) + "k"
    }
    
    // Method to convert number of star into custom star icon
    func carRating() -> String {
        var star = "★"
        let space = "" + star
        for _ in 1..<rating {
            star.append(space)
        }
        return star
    }

}

