//
//  ResultsController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 01.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class ResultsController: UIViewController {
    
    var levelsManager: LevelsManager
    var level: Level
    
    init(levelsManager: LevelsManager) {
        self.levelsManager = levelsManager
        self.level = levelsManager.getCurrentLevel()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let star1: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "star")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let star2: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "star")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let star3: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "star")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let homenBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(hexString: "F7ECFF", alpha: 0.15)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Домой", for: .normal)
        btn.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside)
        
        return btn
    }()
    
    let againBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(hexString: "F7ECFF", alpha: 0.15)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Еще раз", for: .normal)
        btn.addTarget(self, action: #selector(againButtonPressed), for: .touchUpInside)
        
        return btn
    }()
    
    let nextBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(hexString: "F7ECFF", alpha: 0.15)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Далее", for: .normal)
        btn.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        
        return btn
    }()
    
    let btnSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 0
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    let starSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 0
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    let rootSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 0
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        let title = levelsManager.getCurrentLevel().title
        let image = levelsManager.getCurrentLevel().image
        let stars = levelsManager.getCurrentLevel().stars
        levelName.text = title
        
        levelImage.image = UIImage(named: image)
        levelImage.layer.borderColor = UIColor.white.cgColor
        levelImage.layer.cornerRadius = levelImage.frame.size.height / 2
        levelImage.layer.borderWidth = 2
        
        if stars == 2 {
            star3.isHidden = true
        } else if stars == 1 {
            star2.isHidden = true
            star3.isHidden = true
        } else if stars == 0 {
            star1.isHidden = true
            star2.isHidden = true
            star3.isHidden = true
        }
        
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(hexString: "1F2124")
        levelImage.image = UIImage(named: level.image)
        levelName.text = level.title
        
        for view in [levelName, levelImage, btnSV] {
            let wrapperView = UIView()
            wrapperView.addSubview(view)
            wrapperView.translatesAutoresizingMaskIntoConstraints = false
            
            view.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
            
            switch view {
            case levelName:
                wrapperView.addSubview(starSV)
                for star in [star1, star2, star3] {
                    starSV.addArrangedSubview(star)
                }
                
                levelName.bottomAnchor.constraint(equalTo: starSV.topAnchor, constant: -20).isActive = true
                starSV.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
                starSV.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -20).isActive = true
                starSV.widthAnchor.constraint(equalToConstant: 200).isActive = true
                starSV.heightAnchor.constraint(equalToConstant: 50).isActive = true
            case levelImage:
                NSLayoutConstraint.activate([
                    levelImage.heightAnchor.constraint(equalTo: wrapperView.heightAnchor),
                    levelImage.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
                    levelImage.widthAnchor.constraint(equalTo: levelImage.heightAnchor)
                ])
            case btnSV:
                for btn in [homenBtn, againBtn, nextBtn] {
                    btnSV.addArrangedSubview(btn)
                    btn.heightAnchor.constraint(equalToConstant: 52).isActive = true
                }
                
                btnSV.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor).isActive = true
                btnSV.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor).isActive = true
                btnSV.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor).isActive = true
            default: break
                
            }
            rootSV.addArrangedSubview(wrapperView)
        }
        
        self.view.addSubview(rootSV)
        
        NSLayoutConstraint.activate([
            rootSV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootSV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            rootSV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rootSV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc func againButtonPressed(_ sender: UIButton) {
         let vc = QuizController(levelsManager: levelsManager)
           
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func nextButtonPressed(_ sender: UIButton) {
        levelsManager.nextLevel()
        let vc = LevelPreviewController(levelsManager: levelsManager)
                  
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func homeButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
          levelImage.layer.cornerRadius = levelImage.frame.width / 2
      }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async {
            self.levelImage.layer.cornerRadius = self.levelImage.frame.size.height / 2
        }
    }
}
