//
//  ModeCell.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 24.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class ModeCell: UICollectionViewCell {
    static let reuseIdentifier = "mode-cell-reuse-identifier"
    
    var bgColor: String = "C13042" {
        didSet {
            configure()
        }
    }
    
    let titleLabel = UILabel()
    let imageView = UIImageView()
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = UIColor(hexString: bgColor)
        
        gradientLayer.colors = [UIColor(hexString: "111111", alpha: 0.6).cgColor, UIColor.clear.cgColor]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint =  CGPoint(x: 1, y: 0)
        gradientLayer.frame = contentView.frame
        
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        contentView.layer.insertSublayer(gradientLayer, at: 0)
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        
        
        let spacing = CGFloat(10)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
}
