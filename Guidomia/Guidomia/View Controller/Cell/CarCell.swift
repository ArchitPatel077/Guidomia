//
//  CarCell.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-05.
//

import Foundation
import UIKit

class CarCell: UITableViewCell {
    
    let carImage = UIImageView()
    let carName = UILabel()
    let carPrice = UILabel()
    let carRating = UILabel()
    
    let carListingStackView = UIStackView()
    
    let underlineView = UIView()
    let cellBackgroundView = UIView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 170
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CarCell {
    private func setup() {
        carImage.translatesAutoresizingMaskIntoConstraints = false
        carImage.image = UIImage(named: "BMW_330i")
        
        carName.translatesAutoresizingMaskIntoConstraints = false
        carName.font = .systemFont(ofSize: 19, weight: .bold)
        carName.textAlignment = .left
        carName.textColor = UIColor(named: "carDarkGreyColor")
        carName.text = "BMW_330i"
        
        carPrice.translatesAutoresizingMaskIntoConstraints = false
        carPrice.font = .systemFont(ofSize: 18, weight: .semibold)
        carPrice.textAlignment = .left
        carPrice.textColor = UIColor(named: "carDarkGreyColor")
        carPrice.text = "120k"
        
        carRating.translatesAutoresizingMaskIntoConstraints = false
        carRating.font = .systemFont(ofSize: 18, weight: .semibold)
        carRating.textAlignment = .left
        carRating.textColor = UIColor(named: "carOrangeColor")
        carRating.text = "★"
        
        carListingStackView.translatesAutoresizingMaskIntoConstraints = false
        carListingStackView.axis = .vertical
        carListingStackView.spacing = 7
        
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = UIColor(named: "carOrangeColor")
        
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        cellBackgroundView.backgroundColor = UIColor(named: "carLightGreyColor")
        
        carListingStackView.addArrangedSubview(carName)
        carListingStackView.addArrangedSubview(carPrice)
        carListingStackView.addArrangedSubview(carRating)
        
        cellBackgroundView.addSubview(carImage)
        cellBackgroundView.addSubview(carListingStackView)
        
        contentView.addSubview(cellBackgroundView)
        contentView.addSubview(underlineView)
    
    }
    
    private func layout() {
        
        //cellbackgroundview
        NSLayoutConstraint.activate([
            cellBackgroundView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            cellBackgroundView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            cellBackgroundView.heightAnchor.constraint(equalToConstant: 130),
            cellBackgroundView.widthAnchor.constraint(equalToConstant: 414)
        ])
        
        //CarImage
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            carImage.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            carImage.heightAnchor.constraint(equalToConstant: 70),
            carImage.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        //CarName
        NSLayoutConstraint.activate([
            carListingStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            carListingStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: carImage.trailingAnchor, multiplier: 2)
        ])
        
        //underlineView
        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: cellBackgroundView.bottomAnchor, multiplier: 2),
            underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: underlineView.trailingAnchor, multiplier: 2),
            underlineView.widthAnchor.constraint(equalToConstant: 200),
            underlineView.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
}
