//
//  LevelPreviewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 15.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class LevelPreviewController: UIViewController {
    var level: Level
    
    init(level: Level) {
        self.level = level
        super.init(nibName: nil, bundle: nil)
        self.edgesForExtendedLayout = .all
        self.hidesBottomBarWhenPushed = true
    }
    
    let levelImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let levelName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let levelStartBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(hexString: "F7ECFF", alpha: 0.15)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Start", for: .normal)
        
        return btn
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = NSLayoutConstraint.Axis.vertical
        sv.distribution = UIStackView.Distribution.fillEqually
        sv.alignment = UIStackView.Alignment.center
        sv.spacing = 16.0
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "1F2124")
        
        
        
        setupView()
    }
    
    func setupView() {
        levelImage.image = UIImage(named: level.image)
        levelName.text = level.title
        
        let nameWrapper = UIView()
        nameWrapper.translatesAutoresizingMaskIntoConstraints = false
        nameWrapper.backgroundColor = .red
        nameWrapper.addSubview(levelName)
        
        let imageWrapper = UIView()
        imageWrapper.backgroundColor = .green
        imageWrapper.translatesAutoresizingMaskIntoConstraints = false
        imageWrapper.addSubview(levelImage)
        
        let btnWrapper = UIView()
        btnWrapper.backgroundColor = .blue
        btnWrapper.translatesAutoresizingMaskIntoConstraints = false
        btnWrapper.addSubview(levelStartBtn)
        
        stackView.addArrangedSubview(nameWrapper)
        stackView.addArrangedSubview(imageWrapper)
        stackView.addArrangedSubview(btnWrapper)
        
        self.view.addSubview(stackView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": stackView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": stackView]))
        
        imageWrapper.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": levelImage]))
        
        levelName.bottomAnchor.constraint(equalTo: nameWrapper.bottomAnchor, constant: -20).isActive = true
        
        levelImage.centerXAnchor.constraint(equalTo: imageWrapper.centerXAnchor).isActive = true
        levelImage.centerYAnchor.constraint(equalTo: imageWrapper.centerYAnchor).isActive = true
        levelImage.addConstraint(NSLayoutConstraint(
            item: levelImage,
            attribute: .height,
            relatedBy: .equal,
            toItem: levelImage,
            attribute: .width,
            multiplier: 1,
            constant: 0)
        )
        
        levelName.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        levelName.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        levelStartBtn.heightAnchor.constraint(equalToConstant: 50 ).isActive = true
        levelStartBtn.centerYAnchor.constraint(equalTo: btnWrapper.centerYAnchor).isActive = true
        levelStartBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        levelStartBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
