//
//  PaintingCell.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 07.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//
import UIKit

class PaintingCell: UICollectionViewCell {
      @IBOutlet weak var paintingImageView: UIImageView!
      @IBOutlet weak var paintingTitleLabel: UILabel!
      
      var painting: Painting! {
          didSet {
            if let safePainter = painting {
                paintingImageView.image = UIImage(named: safePainter.image)
                paintingTitleLabel.text = safePainter.name
            }
          }
      }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        paintingImageView.layer.cornerRadius = 5
    }

}
