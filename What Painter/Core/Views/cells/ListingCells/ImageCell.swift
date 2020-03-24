//
//  ImageCell.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 22.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    static let reuseIdentifier = "image-cell-reuse-identifire"
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ImageCell {
    func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 55
        imageView.layer.borderColor = UIColor.systemPink.cgColor
        imageView.layer.borderWidth = 1
        contentView.addSubview(imageView)
        
        let inset = CGFloat(0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
}
