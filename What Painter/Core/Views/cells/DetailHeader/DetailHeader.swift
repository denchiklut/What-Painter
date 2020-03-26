//
//  DetailHeader.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 08.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class DetailHeader: UICollectionReusableView {
    static let reuseIdentifier = "detail-header-identofire"
    
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
    
    let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
        layer.locations = [0.4, 0.9, 1.0]
        
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let objectView = object as? UIImageView, objectView === bgImahe, keyPath == #keyPath(UIImageView.bounds) {

            CATransaction.begin()
            CATransaction.setDisableActions(true)
            gradientLayer.frame = objectView.bounds
            CATransaction.commit()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(bgImahe)
        addSubview(titlelabel)
        addSubview(typebtn)
        bgImahe.layer.mask = gradientLayer
        bgImahe.addObserver(self, forKeyPath: #keyPath(UIImageView.bounds), options: .new, context: nil)
        
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
}

