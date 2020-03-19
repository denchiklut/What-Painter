//
//  QuizController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 17.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class QuizController: UIViewController {

    var levelsManager: LevelsManager
    
    init(levelsManager: LevelsManager) {
        self.levelsManager = levelsManager
        
        super.init(nibName: nil, bundle: nil)
    }
    
    let quizImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false

        return iv
    }()

    let bgImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false

        return iv
    }()

    let choice1: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(hexString: "F7ECFF", alpha: 0.15)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("choice1", for: .normal)
        btn.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)

        return btn
    }()

    let choice2: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(hexString: "F7ECFF", alpha: 0.15)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("choice1", for: .normal)
        btn.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
        return btn
    }()

    let choice3: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(hexString: "F7ECFF", alpha: 0.15)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("choice1", for: .normal)
        btn.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)

        return btn
    }()

    let choice4: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(hexString: "F7ECFF", alpha: 0.15)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("choice1", for: .normal)
        btn.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)

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
        btn.addTarget(self, action: #selector(nextBtnPressed), for: .touchUpInside)

        return btn
    }()

    let vissualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false

        return blurEffectView
    }()

    let modalView: UIView = {
        let modal = UIView()
        modal.backgroundColor = .darkGray
        modal.translatesAutoresizingMaskIntoConstraints = false

        return modal
    }()

    let imageName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let rootSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    let row1SV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    let row2SV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()

    var effect: UIVisualEffect!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        effect = vissualEffectView.effect
        vissualEffectView.effect = nil
        vissualEffectView.isHidden = true
        modalView.layer.cornerRadius = 5
        levelsManager.getCurrentLevel().quiz.delegate = self

        setupView()
        updateUI()
    }

    @objc func answerButtonPressed(_ sender: UIButton) {
        if let answer = sender.currentTitle {
            if levelsManager.getCurrentLevel().quiz.checkAnswer(a: answer) {
                sender.backgroundColor = UIColor.green
                showModal()
            } else {
                sender.backgroundColor = UIColor.red
            }
        }
    }

    @objc func nextBtnPressed(_ sender: UIButton) {
        levelsManager.getCurrentLevel().quiz.nextQuestion()
        updateUI()
        hideModal()
    }
    
    func setupView() {
        view.backgroundColor = UIColor(hexString: "1F2124")
        modalView.addSubview(imageName)
        modalView.addSubview(nextBtn)
        
        row1SV.addArrangedSubview(choice1)
        row1SV.addArrangedSubview(choice2)
        row2SV.addArrangedSubview(choice3)
        row2SV.addArrangedSubview(choice4)
        
        rootSV.addArrangedSubview(quizImage)
        rootSV.addArrangedSubview(row1SV)
        rootSV.addArrangedSubview(row2SV)
        

        view.addSubview(rootSV)
        view.addSubview(vissualEffectView)
        
        NSLayoutConstraint.activate([
            rootSV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootSV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            rootSV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rootSV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            modalView.heightAnchor.constraint(equalToConstant: 200),
            modalView.widthAnchor.constraint(equalToConstant: 300),
            
            imageName.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            imageName.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 20),
            imageName.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -20),
            imageName.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 20),
            
            nextBtn.bottomAnchor.constraint(equalTo: modalView.bottomAnchor, constant: -20),
            nextBtn.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            nextBtn.heightAnchor.constraint(equalToConstant: 50),
            nextBtn.widthAnchor.constraint(equalToConstant: 200),
            
            vissualEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            vissualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            vissualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vissualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        for btn in [choice1, choice2, choice3, choice4] {
            btn.heightAnchor.constraint(equalToConstant: 52).isActive = true
        }
    }

    @objc func updateUI() {
        let answers = levelsManager.getCurrentLevel().quiz.getAnswers()
        let image = levelsManager.getCurrentLevel().quiz.getImage()
        
        quizImage.image = UIImage(named: image)
        bgImage.image = UIImage(named: image)

        choice1.setTitle(answers[0], for: .normal)
        choice2.setTitle(answers[1], for: .normal)
        choice3.setTitle(answers[2], for: .normal)
        choice4.setTitle(answers[3], for: .normal)

        choice1.backgroundColor = UIColor.darkGray
        choice2.backgroundColor = UIColor.darkGray
        choice3.backgroundColor = UIColor.darkGray
        choice4.backgroundColor = UIColor.darkGray
    }

    func showModal() {
        vissualEffectView.isHidden = false
        
        self.view.addSubview(modalView)
        
        modalView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        modalView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        modalView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        modalView.alpha = 0

        let imgName = levelsManager.getCurrentLevel().quiz.getImageName()
        imageName.text = imgName

        UIView.animate(withDuration: 0.4) {
            self.vissualEffectView.effect = self.effect
            self.modalView.alpha = 1
            self.modalView.transform = CGAffineTransform.identity
        }
    }

    func hideModal() {
        UIView.animate(withDuration: 0.4, animations: {
            self.modalView.alpha = 0
            self.modalView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.vissualEffectView.effect = nil
        }) { (success: Bool) in
            self.modalView.removeFromSuperview()
            self.vissualEffectView.isHidden = true
        }
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async {
            self.modalView.center = self.view.center
        }
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QuizController: QuizBrainDelegate {
    func quizDidFinished(_ sender: QuizBrain, with score: Int) {
        levelsManager.getCurrentLevel().updateStars(score: score)

        let vc = ResultsController(levelsManager: levelsManager)
                  
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

