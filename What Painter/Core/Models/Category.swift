//
//  Category.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 11.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation

let leonardo = [
    Painting(image: "1", name: "Моно Лиза"),
    Painting(image: "7", name: "Дама с Горностаем")
]

let vanGog = [
    Painting(image: "4", name: "Звездная ночь"),
    Painting(image: "6", name: "Подсолнухи")
]
let rafael = [Painting(image: "11", name: "Сикстинская Маддона")]
let munk = [Painting(image: "8", name: "Крик")]
let vermmer = [Painting(image: "2", name: "Девушка с жемчужной сережкой")]


let painterList = [
    CategoryItem(name: "да Винчи", image: "1", paintings: leonardo),
    CategoryItem(name: "Ван Гог", image: "4", paintings: vanGog),
    CategoryItem(name: "Рафаэль", image: "10", paintings: rafael),
    CategoryItem(name: "Мунк", image: "8", paintings: munk),
    CategoryItem(name: "Вермеер", image: "2", paintings: vermmer)
]

let musiamsList = [
    CategoryItem(name: "Лувр", image: "2", paintings: leonardo),
    CategoryItem(name: "д'Орсе", image: "5", paintings: vanGog),
    CategoryItem(name: "Парадо", image: "9", paintings: rafael),
    CategoryItem(name: "Армитаж", image: "3", paintings: munk)
]

class Category {
    var name: String?
    var items: [CategoryItem]?
    
    static func sampleCategories() -> [Category] {
        let painterCategory = Category()
        painterCategory.name = "Писатели"
        painterCategory.items = painterList
        
        let musiamCategory = Category()
        musiamCategory.name = "Музеи"
        musiamCategory.items = musiamsList
         
        return [painterCategory, musiamCategory]
    }
}

class CategoryItem {
    let name: String
    let image: String
    let paintings: [Painting]
    
    init(name: String, image: String, paintings: [Painting]) {
        self.name = name
        self.image = image
        self.paintings = paintings
    }
}

