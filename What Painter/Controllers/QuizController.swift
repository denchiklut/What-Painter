//
//  PlayController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 29.02.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class QuizController: UIViewController {
    
    var levelData: Level?
    
    @IBOutlet weak var quizImage: UIImageView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
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
        levelData?.quiz.delegate = self
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if let answer = sender.currentTitle {
            if levelData!.quiz.checkAnswer(a: answer) {
                sender.backgroundColor = UIColor.green
                levelData?.quiz.nextQuestion()
                
                Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            } else {
                sender.backgroundColor = UIColor.red
            }
        }
    }
    
    @objc func updateUI() {
        if let answers = levelData?.quiz.getAnswers(), let image = levelData?.quiz.getImage() {
            quizImage.image = UIImage(named: image)
            
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
}

extension QuizController: QuizBrainDelegate {
    func quizDidFinished(_ sender: QuizBrain, with score: Int) {
        levelData?.updateStars(score: score)
        print("Level did finished with score \(levelData?.stars)")
    }
}
