//
//  PaintersCollection.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 05.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class PaintersCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var paintingImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var paintingTitleLabel: UILabel!
    
    var painter: Painter! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let painter = painter {
            paintingImageView.image = painter.image
            paintingTitleLabel.text = painter.name
            backgroundColorView.backgroundColor = painter.color
        }
         
        paintingImageView.layer.cornerRadius = 10.0
        backgroundColorView.layer.cornerRadius = 10.0
        paintingImageView.layer.masksToBounds = true
        backgroundColorView.layer.masksToBounds = true
    }
}
