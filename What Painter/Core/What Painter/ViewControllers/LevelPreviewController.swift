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
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.backgroundColor = .yellow
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 0
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
        nameWrapper.addSubview(levelName)
        
        let imageWrapper = UIView()
        imageWrapper.translatesAutoresizingMaskIntoConstraints = false
        imageWrapper.addSubview(levelImage)
        
        let btnWrapper = UIView()
        btnWrapper.translatesAutoresizingMaskIntoConstraints = false
        btnWrapper.addSubview(levelStartBtn)
        
        stackView.addArrangedSubview(nameWrapper)
        stackView.addArrangedSubview(imageWrapper)
        stackView.addArrangedSubview(btnWrapper)
        
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            levelName.centerXAnchor.constraint(equalTo: nameWrapper.centerXAnchor),
            levelName.bottomAnchor.constraint(equalTo: nameWrapper.bottomAnchor, constant: -20),
            
            levelImage.centerXAnchor.constraint(equalTo: imageWrapper.centerXAnchor),
            levelImage.centerYAnchor.constraint(equalTo: imageWrapper.centerYAnchor),
            levelImage.heightAnchor.constraint(equalTo: imageWrapper.heightAnchor),
            levelImage.widthAnchor.constraint(equalTo: levelImage.heightAnchor),
            
            levelStartBtn.widthAnchor.constraint(equalToConstant: 250),
            levelStartBtn.heightAnchor.constraint(equalToConstant: 50),
            levelStartBtn.centerXAnchor.constraint(equalTo: btnWrapper.centerXAnchor),
            levelStartBtn.centerYAnchor.constraint(equalTo: btnWrapper.centerYAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        levelImage.layer.cornerRadius = levelImage.frame.width / 2
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async {
            self.levelImage.layer.cornerRadius = self.levelImage.frame.width / 2
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
