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
    
    let prosLabel = UILabel()
    let prosList = UILabel()
    let consLabel = UILabel()
    let consList = UILabel()
    
    let carListingStackView = UIStackView()
    let carDetailsStackView = UIStackView()
    
    let underlineView = UIView()
    let cellBackgroundView = UIView()
    
    public var car: Cars? {
        didSet {
            displayCarList()
        }
    }
    
  
    // Reuse identifier for tableview cell
    static let reuseID = "AccountCell"
    static let rowHeight: CGFloat = 350
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Custom Design and layout  for tableview cell

extension CarCell {
    
    private func setup() {
        
        // car image
        carImage.translatesAutoresizingMaskIntoConstraints = false
        carImage.image = UIImage(named: "BMW_330i")
        
        //car name
        carName.translatesAutoresizingMaskIntoConstraints = false
        carName.font = .systemFont(ofSize: 19, weight: .bold)
        carName.textAlignment = .left
        carName.textColor = UIColor(named: "carDarkGreyColor")
        carName.text = "BMW_330i"
        
        // car price
        carPrice.translatesAutoresizingMaskIntoConstraints = false
        carPrice.font = .systemFont(ofSize: 18, weight: .semibold)
        carPrice.textAlignment = .left
        carPrice.textColor = UIColor(named: "carDarkGreyColor")
        carPrice.text = "120k"
        
        //car rating
        carRating.translatesAutoresizingMaskIntoConstraints = false
        carRating.font = .systemFont(ofSize: 18, weight: .semibold)
        carRating.textAlignment = .left
        carRating.textColor = UIColor(named: "carOrangeColor")
        carRating.text = "★"
        
        // Vertical stack for [car name, car price, car rating]
        carListingStackView.translatesAutoresizingMaskIntoConstraints = false
        carListingStackView.axis = .vertical
        carListingStackView.spacing = 7
        
        // Pros Label
        prosLabel.translatesAutoresizingMaskIntoConstraints = false
        prosLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        prosLabel.textAlignment = .left
        prosLabel.text = "Pros :"
        prosLabel.textColor = UIColor(named: "carDarkGreyColor")
        
        // Pros List
        prosList.translatesAutoresizingMaskIntoConstraints = false
        prosList.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        prosList.textAlignment = .left
        prosList.text = "Pro List"
        prosList.textColor = .black
        prosList.adjustsFontSizeToFitWidth = true
        prosList.numberOfLines = 4
        
        // Cons Label
        consLabel.translatesAutoresizingMaskIntoConstraints = false
        consLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        consLabel.textAlignment = .left
        consLabel.text = "Cons:"
        consLabel.textColor = UIColor(named: "carDarkGreyColor")
        
        //Cons List
        consList.translatesAutoresizingMaskIntoConstraints = false
        consList.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        consList.textAlignment = .left
        consList.text = "Con List"
        consList.textColor = .black
        consList.adjustsFontSizeToFitWidth = true
        consList.numberOfLines = 4
        
        // Vertical stack for car pros and cons
        carDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        carDetailsStackView.axis = .vertical
        carDetailsStackView.spacing = 2
        
        // Underline view
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = UIColor(named: "carOrangeColor")
        
        // custom backgroudview
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        cellBackgroundView.backgroundColor = UIColor(named: "carLightGreyColor")
        cellBackgroundView.clipsToBounds = true
        
        carListingStackView.addArrangedSubview(carName)
        carListingStackView.addArrangedSubview(carPrice)
        carListingStackView.addArrangedSubview(carRating)
        
        carDetailsStackView.addArrangedSubview(prosLabel)
        carDetailsStackView.addArrangedSubview(prosList)
        carDetailsStackView.addArrangedSubview(consLabel)
        carDetailsStackView.addArrangedSubview(consList)
        
        cellBackgroundView.addSubview(carImage)
        cellBackgroundView.addSubview(carListingStackView)
        cellBackgroundView.addSubview(carDetailsStackView)
        
        contentView.addSubview(cellBackgroundView)
        contentView.addSubview(underlineView)
    
    }
    
    private func layout() {
        
        //cellbackgroundview
        NSLayoutConstraint.activate([
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
        
        //CarImage
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 6),
            carImage.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            carImage.heightAnchor.constraint(equalToConstant: 70),
            carImage.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        //CarName
        NSLayoutConstraint.activate([
            carListingStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 6),
            carListingStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: carImage.trailingAnchor, multiplier: 2)
        ])
        
        //CarDetailsStackView
        NSLayoutConstraint.activate([
            carDetailsStackView.topAnchor.constraint(equalToSystemSpacingBelow: carImage.bottomAnchor, multiplier: 2),
            carDetailsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2)
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

// MARK: - Function to load data into tableview cell

extension CarCell {
    
    func displayCarList() {
        carName.text = car?.carName()
        carPrice.text = car?.carPrice()
        carRating.text = car?.carRating()
        carImage.image = car?.carImage()
        
        guard let carProsList = car?.prosList.filter({$0.isEmpty == false}) else {return}
        prosList.attributedText = NSAttributedString().displayBulletedText(for:carProsList)
        print(NSAttributedString().displayBulletedText(for: carProsList))
        guard let carConsList = car?.consList.filter({$0.isEmpty == false}) else {return}
        consList.attributedText = NSAttributedString().displayBulletedText(for: carConsList)
    }
}

// MARK: - Animation method to expand tableview cell

extension CarCell {
    func animate() {
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.contentView.layoutIfNeeded()
        })
    }
}
