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
    
    var data: Level? {
        didSet {
            guard let imageName = data?.image, let title = data?.title  else {return}
            levelImage.image = UIImage(named: imageName)
            levelTitle.text = title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        levelImage.layer.cornerRadius = levelImage.frame.size.width / 2
        levelImage.layer.borderColor = UIColor.white.cgColor
        levelImage.layer.borderWidth = 2
    }

}
