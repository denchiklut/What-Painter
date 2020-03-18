//
//  LevelPreviewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 15.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class LevelPreviewController: UIViewController {
    var levelsManager: LevelsManager
    var level: Level
    
    init(levelsManager: LevelsManager) {
        self.levelsManager = levelsManager
        self.level = levelsManager.getCurrentLevel()
        
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
        btn.addTarget(self, action: #selector(startQuezPressed), for: .touchUpInside)
        
        return btn
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
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
        
        for view in [levelName, levelImage, levelStartBtn] {
            let wrapperView = UIView()
            wrapperView.addSubview(view)
            wrapperView.translatesAutoresizingMaskIntoConstraints = false
            
            view.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
            
            switch view {
            case levelName:
                levelName.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -20).isActive = true
            case levelImage:
                NSLayoutConstraint.activate([
                    levelImage.heightAnchor.constraint(equalTo: wrapperView.heightAnchor),
                    levelImage.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
                    levelImage.widthAnchor.constraint(equalTo: levelImage.heightAnchor)
                ])
            default:
                NSLayoutConstraint.activate([
                    view.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
                    levelStartBtn.widthAnchor.constraint(equalToConstant: 250),
                    levelStartBtn.heightAnchor.constraint(equalToConstant: 50)
                ])
            }
            stackView.addArrangedSubview(wrapperView)
        }
        
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc func startQuezPressed(_ sender: UIButton) {
        let vc = QuizController(levelsManager: levelsManager)
           
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        levelImage.layer.cornerRadius = levelImage.frame.width / 2
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async {
            self.levelImage.layer.cornerRadius = self.levelImage.frame.width / 2
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
