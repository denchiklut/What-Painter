//
//  LevelsManager.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 01.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation

let trainingQuiz = [
    Question(image: "1", answers: ["да Винчи", "Микеланджело", "Рафаэль", "Боттичели"], correctAnswer: "да Винчи"),
    Question(image: "8", answers: ["Мунк", "Пикассо", "Кандинский", "Климт"], correctAnswer: "Мунк"),
    Question(image: "5", answers: ["Мунк", "Матис", "Гоген", "Климт"], correctAnswer: "Климт"),
    Question(image: "6", answers: ["Матис", "Гоген", "Пикассо", "Ван Гог"], correctAnswer: "Ван Гог"),
    Question(image: "7", answers: ["Рафаэль", "Боттичели", "да Винчи", "Микеланджело"], correctAnswer: "да Винчи")
]

let worldQuiz = [
    Question(image: "2", answers: ["Вермеер", "Рембрант", "Ван Дейк", "Тициан"], correctAnswer: "Вермеер"),
    Question(image: "9", answers: ["Рембрант", "Мурильо", "Тициан", "Веласкес"], correctAnswer: "Рембрант"),
    Question(image: "10", answers: ["Боттичели", "да Винчи", "Тициан", "Рафаэль"], correctAnswer: "Боттичели"),
    Question(image: "4", answers: ["Мунк", "Гоген", "Ван Гог", "Сезанн"], correctAnswer: "Ван Гог"),
    Question(image: "11", answers: ["Боттичели", "Рафаэль", "да Винчи", "Микеланджело"], correctAnswer: "Рафаэль")
]

let frenchQuiz = [
    Question(image: "12", answers: ["Коро", "Пуссен", "Милле", "Курбе"], correctAnswer: "Курбе"),
    Question(image: "13", answers: ["Курбе", "Пуссен", "Милле", "Коро"], correctAnswer: "Курбе"),
    Question(image: "14", answers: ["Энг", "Коро", "Милле", "Курбе"], correctAnswer: "Милле"),
    Question(image: "15", answers: ["Дэга", "Моне", "Мане", "Моризо"], correctAnswer: "Мане"),
    Question(image: "16", answers: ["Буше", "Энгр", "Курбе", "Пуссен"], correctAnswer: "Буше")
]

let luvrQuiz = [
    Question(image: "17", answers: ["да Винчи", "Джорджоне", "Рафаэль", "Тициан"], correctAnswer: "да Винчи"),
    Question(image: "18", answers: ["Энгр", "Пуссен", "Делакруа", "Караваджо"], correctAnswer: "Энгр"),
    Question(image: "19", answers: ["Пуссен", "Делакруа", "Энгр", "Шеффер"], correctAnswer: "Делакруа"),
    Question(image: "20", answers: ["Шеффер", "Тициан", "Делакруа", "Боттичели"], correctAnswer: "Тициан"),
    Question(image: "21", answers: ["Рембрант", "Ван Дэйк", "Дюррер", "Вермеер"], correctAnswer: "Вермеер")
]

struct LevelsManager {
    var levels = [
        Level(title: "Разминка", image: "1", quiz: QuizBrain(quiz: trainingQuiz)),
        Level(title: "Мировые шедеврвы", image: "2", quiz: QuizBrain(quiz: worldQuiz)),
        Level(title: "Франция", image: "3", quiz: QuizBrain(quiz: frenchQuiz)),
        Level(title: "Лувр", image: "4", quiz: QuizBrain(quiz: luvrQuiz)),
    ]
}
