//
//  PlayManager.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 01.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation

protocol QuizBrainDelegate {
    func quizDidFinished(_ sender: QuizBrain, with score: Int)
}

class QuizBrain {
    var current = 0
    var errors = Set<Int>()
    
    var quiz: [Question]
    var delegate: QuizBrainDelegate?
    
    init(quiz: [Question]) {
        self.quiz = quiz
    }
    
    func getImage() -> String {
        return quiz[current].image
    }
    
    func getImageName() -> String {
           return quiz[current].name
       }
    
    func getAnswers() -> [String] {
        return quiz[current].answers
    }
    
    func nextQuestion() {
        if current + 1 < quiz.count {
            current += 1
        } else {
            self.delegate?.quizDidFinished(self, with: getScore())
        }
    }
    
    func checkAnswer(a: String) -> Bool {
        if a == quiz[current].correctAnswer {
            return true
        } else {
            errors.insert(current)
            return false
        }
    }
    
    func getScore() -> Int {
        return quiz.count - errors.count
    }
}
