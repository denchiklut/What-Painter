//
//  PlayController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 29.02.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class QuizController: UIViewController {
    
    var levelsManager: LevelsManager?
    
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    @IBOutlet weak var vissualEffectView: UIVisualEffectView!
    @IBOutlet var modalView: UIView!
    @IBOutlet weak var imageName: UILabel!
    
    var effect: UIVisualEffect!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = vissualEffectView.effect
        vissualEffectView.effect = nil
        vissualEffectView.isHidden = true
        modalView.layer.cornerRadius = 5
        levelsManager?.getCurrentLevel().quiz.delegate = self
    
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if let answer = sender.currentTitle {
            if levelsManager!.getCurrentLevel().quiz.checkAnswer(a: answer) {
                sender.backgroundColor = UIColor.green
                showModal()
            } else {
                sender.backgroundColor = UIColor.red
            }
        }
    }
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        levelsManager?.getCurrentLevel().quiz.nextQuestion()
        updateUI()
        hideModal()
    }
    
    @objc func updateUI() {
        if let answers = levelsManager?.getCurrentLevel().quiz.getAnswers(), let image = levelsManager?.getCurrentLevel().quiz.getImage() {
            quizImage.image = UIImage(named: image)
            bgImage.image = UIImage(named: image)
            
            choice1.setTitle(answers[0], for: .normal)
            choice2.setTitle(answers[1], for: .normal)
            choice3.setTitle(answers[2], for: .normal)
            choice4.setTitle(answers[3], for: .normal)
        }
        
        choice1.backgroundColor = UIColor.darkGray
        choice2.backgroundColor = UIColor.darkGray
        choice3.backgroundColor = UIColor.darkGray
        choice4.backgroundColor = UIColor.darkGray
    }
    
    func showModal() {
        vissualEffectView.isHidden = false
        self.view.addSubview(modalView)
        modalView.center = self.view.center
        modalView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        modalView.alpha = 0
        
        if let imgName = levelsManager?.getCurrentLevel().quiz.getImageName() {
            imageName.text = imgName
        }
        
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
}

extension QuizController: QuizBrainDelegate {
    func quizDidFinished(_ sender: QuizBrain, with score: Int) {
        levelsManager?.getCurrentLevel().updateStars(score: score)
        
        performSegue(withIdentifier: K.resultsSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.resultsSegue {
            let dc = segue.destination as! ResultsController
            dc.levelsManager = levelsManager
        }
    }
}
