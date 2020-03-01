//
//  LevelsManager.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 01.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation

let trainingQuiz = [
    Question(image: "1", answers: ["да Винчи", "Микеланджело", "Рафаэль", "Боттичели"], correctAnswer: "да Винчи", name: "Моно Лиза"),
    Question(image: "8", answers: ["Мунк", "Пикассо", "Кандинский", "Климт"], correctAnswer: "Мунк", name: "Крик"),
    Question(image: "5", answers: ["Мунк", "Матис", "Гоген", "Климт"], correctAnswer: "Климт", name: "Поцелуй"),
    Question(image: "6", answers: ["Матис", "Гоген", "Пикассо", "Ван Гог"], correctAnswer: "Ван Гог", name: "Подсолнухи"),
    Question(image: "7", answers: ["Рафаэль", "Боттичели", "да Винчи", "Микеланджело"], correctAnswer: "да Винчи", name: "Дама с горностаем")
]

let worldQuiz = [
    Question(image: "2", answers: ["Вермеер", "Рембрант", "Ван Дейк", "Тициан"], correctAnswer: "Вермеер", name: "Девушка с жемчужной серёжкой"),
    Question(image: "9", answers: ["Рембрант", "Мурильо", "Тициан", "Веласкес"], correctAnswer: "Рембрант", name: "Ночной дозор"),
    Question(image: "10", answers: ["Боттичели", "да Винчи", "Тициан", "Рафаэль"], correctAnswer: "Боттичели", name: "Рождение Венеры"),
    Question(image: "4", answers: ["Мунк", "Гоген", "Ван Гог", "Сезанн"], correctAnswer: "Ван Гог", name: "Звездная ночь"),
    Question(image: "11", answers: ["Боттичели", "Рафаэль", "да Винчи", "Микеланджело"], correctAnswer: "Рафаэль", name: "Сикстинская мадонна")
]

let frenchQuiz = [
    Question(image: "12", answers: ["Коро", "Пуссен", "Милле", "Курбе"], correctAnswer: "Курбе", name: "Похороны в Орнане"),
    Question(image: "13", answers: ["Курбе", "Пуссен", "Милле", "Коро"], correctAnswer: "Курбе", name: "Порыв ветра"),
    Question(image: "14", answers: ["Энг", "Коро", "Милле", "Курбе"], correctAnswer: "Милле", name: "Ночная охота на птиц"),
    Question(image: "15", answers: ["Дэга", "Моне", "Мане", "Моризо"], correctAnswer: "Мане", name: "Бар в «Фоли-Бержер»"),
    Question(image: "16", answers: ["Буше", "Энгр", "Курбе", "Пуссен"], correctAnswer: "Буше", name: "Вулкан, вручающий Венере оружие для Энея")
]

let luvrQuiz = [
    Question(image: "17", answers: ["да Винчи", "Джорджоне", "Рафаэль", "Тициан"], correctAnswer: "да Винчи", name: "Мадонна в скалах"),
    Question(image: "18", answers: ["Энгр", "Пуссен", "Делакруа", "Караваджо"], correctAnswer: "Энгр", name: "Портрет Луи Франсуа Бертена"),
    Question(image: "19", answers: ["Пуссен", "Делакруа", "Энгр", "Шеффер"], correctAnswer: "Делакруа", name: "Ладья Данте"),
    Question(image: "20", answers: ["Шеффер", "Тициан", "Делакруа", "Боттичели"], correctAnswer: "Тициан", name: "Женщина перед зеркалом"),
    Question(image: "21", answers: ["Рембрант", "Ван Дэйк", "Дюррер", "Вермеер"], correctAnswer: "Вермеер", name: "Астроном")
]

struct LevelsManager {
    var levels = [
        Level(title: "Разминка", image: "1", quiz: QuizBrain(quiz: trainingQuiz)),
        Level(title: "Мировые шедеврвы", image: "2", quiz: QuizBrain(quiz: worldQuiz)),
        Level(title: "Франция", image: "3", quiz: QuizBrain(quiz: frenchQuiz)),
        Level(title: "Лувр", image: "4", quiz: QuizBrain(quiz: luvrQuiz)),
    ]
}
