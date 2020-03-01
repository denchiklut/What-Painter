//
//  LevelCell.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 29.02.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class LevelCell: UICollectionViewCell {
    
    @IBOutlet weak var levelImage: UIImageView!
    @IBOutlet weak var levelTitle: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    
    
    var data: Level? {
        didSet {
            guard let imageName = data?.image, let title = data?.title  else {return}
            levelImage.image = UIImage(named: imageName)
            levelTitle.text = title
            
            drawStars()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        levelImage.layer.cornerRadius = levelImage.frame.size.width / 2
        levelImage.layer.borderColor = UIColor.white.cgColor
        levelImage.layer.borderWidth = 2
    }
    
    func drawStars() {
        if data?.stars == 2 {
            star1.isHidden = false
            star2.isHidden = false
            star3.isHidden = true
        } else if data?.stars == 1 {
            star1.isHidden = false
            star2.isHidden = true
            star3.isHidden = true
        } else if data?.stars == 0 {
            star1.isHidden = true
            star2.isHidden = true
            star3.isHidden = true
        } else {
            star1.isHidden = false
            star2.isHidden = false
            star3.isHidden = false
        }
    }
    
}
