//
//  CarHeaderView.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-05.
//

import Foundation
import UIKit

class CarHeaderView: UIView {
    
    
    @IBOutlet var filterView: UIView!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          commonInit()
        filterView.layer.cornerRadius = 10
      }
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          commonInit()
      }
      
      override var intrinsicContentSize: CGSize {
          return CGSize(width: UIView.noIntrinsicMetric, height: 370)
      }
      
      private func commonInit() {
          let bundle = Bundle(for: CarHeaderView.self)
          bundle.loadNibNamed("CarHeaderView", owner: self, options: nil)
          addSubview(contentView)
          contentView.backgroundColor = .systemBackground
          
          contentView.translatesAutoresizingMaskIntoConstraints = false
          contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
          contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
          contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
          contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
      }
}
