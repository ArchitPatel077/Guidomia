//
//  CarImages.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-05.
//

import UIKit

// enum to display images
public enum CarImages: String {
    case rangeRover = "Land Rover"
    case alpine     = "Alpine"
    case bmw        = "BMW"
    case mercedes   = "Mercedes Benz"
   
    public var carImage: UIImage {
        
        var imageName: String!
        
        switch self {
        case .rangeRover:
            imageName = "Range_Rover"
        case .alpine:
            imageName = "Alpine_roadster"
        case .bmw:
            imageName = "BMW_330i"
        case .mercedes:
            imageName = "Mercedez_benz_GLC"
        }
        return UIImage(named: imageName) ?? UIImage()
    }
}
