//
//  PaintingCell.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 07.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//
import UIKit

class PaintingCell: UICollectionViewCell {
    static let reuseIdentifier = "painting-cell-reuse-identifire"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bgImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 3
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let imageName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    func setupView() {
        addSubview(bgImage)
        addSubview(imageName)
        
        NSLayoutConstraint.activate([
            bgImage.topAnchor.constraint(equalTo: self.topAnchor),
            bgImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageName.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageName.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageName.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    var painting: Painting! {
        didSet {
            if let safePainter = painting {
                bgImage.image = UIImage(named: safePainter.image)
                imageName.text = safePainter.name
            }
        }
    }
    
}
