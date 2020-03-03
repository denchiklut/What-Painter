//
//  ResultsController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 01.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class ResultsController: UIViewController {
    
    var levelsManager: LevelsManager?
    
    @IBOutlet weak var levelName: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var levelImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let title = levelsManager?.getCurrentLevel().title, let image = levelsManager?.getCurrentLevel().image, let stars = levelsManager?.getCurrentLevel().stars {
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
    }
    
    @IBAction func againButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.playAgainSegue, sender: self)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.nextSegue, sender: self)
    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.playAgainSegue {
            let dc = segue.destination as! QuizController
            dc.levelsManager = levelsManager
        } else if segue.identifier == K.nextSegue {
            let dc = segue.destination as! LevelPreviewController
            levelsManager?.nextLevel()
            dc.levelsManager = levelsManager
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async {
            self.levelImage.layer.cornerRadius = self.levelImage.frame.size.height / 2
        }
    }
}
