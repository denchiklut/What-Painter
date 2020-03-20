//
//  DetailHeader.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 08.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class DetailHeader: UICollectionReusableView {
    
    let bgImahe: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    let titlelabel: UILabel = {
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont.boldSystemFont(ofSize: 50)
        t.textAlignment = .center
        
        return t
    }()
    
    let typebtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemPink
        btn.tintColor = .white
        btn.layer.cornerRadius = 15
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(bgImahe)
        addSubview(titlelabel)
        addSubview(typebtn)
        
        bgImahe.image = UIImage(named: "16")
        titlelabel.text = "Ван Гог"
        typebtn.setTitle("Империониз", for: .normal)
        
        NSLayoutConstraint.activate([
            bgImahe.topAnchor.constraint(equalTo: self.topAnchor),
            bgImahe.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgImahe.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgImahe.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            typebtn.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            typebtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            typebtn.widthAnchor.constraint(equalToConstant: 160),
            
            titlelabel.bottomAnchor.constraint(equalTo: typebtn.topAnchor, constant: -20),
            titlelabel.leadingAnchor.constraint(equalTo:  self.leadingAnchor),
            titlelabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func makeGradient() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer( )
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
        
        gradientLayer.locations = [0.5, 0.9, 1.0]
        
        return gradientLayer
    } 
}

