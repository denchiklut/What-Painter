//
//  DetailHeader.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 08.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class DetailHeader: UICollectionReusableView {
    
    @IBOutlet weak var detailHeaderImage: UIImageView!
    @IBOutlet weak var detailTitile: UILabel!
    @IBOutlet weak var centerBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        centerBtn.layer.cornerRadius = 18
        
        let gradient = makeGradient()
        detailHeaderImage.layer.mask = gradient
    }
    
    var animator: UIViewPropertyAnimator!
    
    func makeGradient() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer( )
        gradientLayer.frame = detailHeaderImage.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
        
        gradientLayer.locations = [0.5, 0.9, 1.0]
        
        return gradientLayer
    } 
}

