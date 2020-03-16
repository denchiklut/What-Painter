//
//  LevelCell.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 15.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class LevelCell: GenericCollectionViewCell<Level> {
    override var item: Level! {
        didSet {
            imageView.image = UIImage(named: item.image)
            nameLabel.text = item.title
            drawStars()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    let star1: UIImageView = {
        let iv = UIImageView()

        iv.image = UIImage(named: "star")
        iv.contentMode = .scaleAspectFill

        return iv
    }()

    let star2: UIImageView = {
        let iv = UIImageView()

        iv.image = UIImage(named: "star")
        iv.contentMode = .scaleAspectFill

        return iv
    }()
    
    let star3: UIImageView = {
        let iv = UIImageView()

        iv.image = UIImage(named: "star")
        iv.contentMode = .scaleAspectFill

        return iv
    }()

    let imageView: UIImageView = {
        let iv = UIImageView()

        iv.image = UIImage(named: "1")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 2

        return iv
    }()

     let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20)

        return label
    }()

    func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(star1)
        addSubview(star2)
        addSubview(star3)
        
        let ratio = frame.width / frame.width
        let scaledHeight = frame.width * ratio

        imageView.layer.cornerRadius = frame.width / 2
        imageView.frame =  CGRect(x: 0, y: 0, width: frame.width, height: scaledHeight)

        star1.frame = CGRect(x: 22, y: frame.height - 60, width: 25, height: 25)
        star2.frame = CGRect(x: 47, y: frame.height - 50, width: 25, height: 25)
        star3.frame = CGRect(x: 72, y: frame.height - 60, width: 25, height: 25)

        nameLabel.frame = CGRect(x: 0, y: frame.height - 30, width: frame.width, height: 40)
    }
    
    func drawStars() {        
        if item?.stars == 2 {
            star1.isHidden = false
            star2.isHidden = false
            star3.isHidden = true
        } else if item?.stars == 1 {
            star1.isHidden = false
            star2.isHidden = true
            star3.isHidden = true
        } else if item?.stars == 0 {
            star1.isHidden = true
            star2.isHidden = true
            star3.isHidden = true
        } else {
            star1.isHidden = false
            star2.isHidden = false
            star3.isHidden = false
        }
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
