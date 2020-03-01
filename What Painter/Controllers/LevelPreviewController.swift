//
//  LevelPreviewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 29.02.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class LevelPreviewController: UIViewController {
    
    @IBOutlet weak var lavelTitile: UILabel!
    @IBOutlet weak var levelImage: UIImageView!
    
    var levelsManager: LevelsManager?
    
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
        
        let data = levelsManager?.getCurrentLevel()
        guard let title = data?.title, let image = data?.image else {return}
        lavelTitile.text = title
        
        levelImage.image = UIImage(named: image)
        levelImage.layer.borderColor = UIColor.white.cgColor
        levelImage.layer.cornerRadius = levelImage.frame.size.height / 2
        levelImage.layer.borderWidth = 2

    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.playSegue, sender: self)
    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.playSegue {
            let dc = segue.destination as! QuizController
            dc.levelsManager = levelsManager
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async {
            self.levelImage.layer.cornerRadius = self.levelImage.frame.size.height / 2
        }
    }
}
