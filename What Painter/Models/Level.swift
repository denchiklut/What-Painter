//
//  Level.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 29.02.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation

class Level {
    let title: String
    let image: String
    var quiz: QuizBrain
    
    var stars = 0
    
    func updateStars(score: Int) {
        switch score {
        case 5:
            stars = 3
        case 3...4:
            stars = 2
        case 2:
            stars = 1
        default:
            stars = 0
        }
    }
    
    init(title: String, image: String, quiz: QuizBrain) {
        self.title = title
        self.image = image
        self.quiz = quiz
    }
}
