//
//  PainterCell.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 07.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class PainterCell: UICollectionViewCell {
    @IBOutlet weak var paintingImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var paintingTitleLabel: UILabel!
    
    var painter: Painter! {
        didSet {
            self.updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        paintingImageView.layer.cornerRadius = 10.0
        backgroundColorView.layer.cornerRadius = 10.0
    }
    
    func updateUI() {
        if let painter = painter {
            paintingImageView.image = painter.image
            paintingTitleLabel.text = painter.name
            backgroundColorView.backgroundColor = painter.color
        }
    }
    
}
