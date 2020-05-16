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
        iv.clipsToBounds = true
        
        return iv
    }()
    
    func setupView() {
        addSubview(bgImage)
        
        NSLayoutConstraint.activate([
            bgImage.topAnchor.constraint(equalTo: self.topAnchor),
            bgImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    var painting: Painting! {
        didSet {
            if let safePainter = painting {
                bgImage.image = UIImage(named: safePainter.image)
            }
        }
    }
    
}
