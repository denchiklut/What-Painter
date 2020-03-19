//
//  PainterCell.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 19.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class PainterCell: TypeCell {
    override func setupViews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = self.frame.width / 2
        imageView.layer.borderColor =  UIColor.systemPink.cgColor
        imageView.layer.borderWidth = 2

        
        addSubview(imageView)
        addSubview(nameLabel)
        
        nameLabel.font = UIFont(name: "Marker Felt", size: 26)
        
        nameLabel.frame = CGRect(x: 0, y: frame.height - 30, width: frame.width, height: 40)
        imageView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageView]))
    }
}
