//
//  OrthogonalViewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 21.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation

class ListingViewController {
    
    var collections: [ListingCollection] {
        return _collections
    }
    
    init() {
        generateCollections()
    }
    
    fileprivate var _collections = [ListingCollection]()
}

extension ListingViewController {
    func generateCollections() {
        _collections = [
            ListingCollection(title: "Писатели",
                              items: [ListingItem(title: "Леонардо да Винчи", image: "1", category: ""),
                                       ListingItem(title: "Ван Гог", image: "2", category: ""),
                                       ListingItem(title: "Вермеер", image: "3", category: ""),
                                       ListingItem(title: "Рафаэль", image: "4", category: ""),
                                       ListingItem(title: "Пабло Пикасо", image: "5", category: ""),
                                       ListingItem(title: "Сальвадор Дали", image: "6", category: "")]),
            
            ListingCollection(title: "Музеи",
                              items: [ListingItem(title: "Лувр", image: "22", category: "Париж"),
                                       ListingItem(title: "Версальский дворец", image: "23", category: "Париж"),
                                       ListingItem(title: "Британская Национальная галерея", image: "24", category: "Лондон"),
                                       ListingItem(title: "Музей Метрополитен", image: "25", category: "Нью-Йорк"),
                                       ListingItem(title: "Музей искусств", image: "26", category: "Филадельфия"),
                                       ListingItem(title: "Музей Гетти", image: "27", category: "Лос-Анджелес"),
                                       ListingItem(title: "LACMA", image: "28", category: "Лос Анджелес"),
                                       ListingItem(title: "Государственный Эрмитаж", image: "29", category: "Санкт-Петербург"),
                                       ListingItem(title: "Музей Прадо", image: "30", category: "Мадрид"),
                                       ListingItem(title: "Рейксмузеум, Национальный музей", image: "31", category: "Амстердам"),
                                       ListingItem(title: "Национальная галерея искусств", image: "32", category: "Вашингтон")]),
            
            ListingCollection(title: "Течение и искусстве",
                              items: [ModeItem(title: "Импрессионизм", image: "33", category: "XIX — XX", color: "C13042"),
                                       ModeItem(title: "Экспрессионизм", image: "41", category: "XX", color: "00C04D"),
                                       ModeItem(title: "Кубизм", image: "35", category: "XX", color: "36AFA4"),
                                       ModeItem(title: "Сюрреализм", image: "36", category: "XX", color: "C5A20E"),
                                       ModeItem(title: "Романтизм", image: "37", category: "XVIII — XIX", color: "5F2FC4"),
                                       ModeItem(title: "Фовизм", image: "38", category: "XIX — XX", color: "C42F6E"),
                                       ModeItem(title: "Реализм", image: "39", category: "XIX — XX", color: "2F35C4"),
                                       ModeItem(title: "Барокко", image: "40", category: "XVII—XVIII", color: "C4772F")]),
            
            ListingCollection(title: "Странны",
                              items: [ListingItem(title: "Италия", image: "14", category: " "),
                                       ListingItem(title: "Франция", image: "18", category: " "),
                                       ListingItem(title: "Британия", image: "19", category: " "),
                                       ListingItem(title: "США", image: "20", category: " "),
                                       ListingItem(title: "Россия", image: "21", category: " "),
                                       ListingItem(title: "Австрия", image: "1", category: " "),
                                       ListingItem(title: "Германия", image: "2", category: " "),
                                       ListingItem(title: "Испания", image: "3", category: " "),
                                       ListingItem(title: "Нидерланды", image: "4", category: " "),
                                       ListingItem(title: "Швеция", image: "5", category: " "),
                                       ListingItem(title: "Япония", image: "6", category: " ")])
        ]
    }
}

class ListingItem: Hashable {
    static func == (lhs: ListingItem, rhs: ListingItem) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    let title: String
    let image: String
    let category: String
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    init(title: String, image: String, category: String) {
        self.title = title
        self.image = image
        self.category = category
    }
}

class ModeItem: ListingItem {
    let color: String
    
    init(title: String, image: String, category: String, color: String) {
        self.color = color
        
        super.init(title: title, image: image, category: category)
    }
}

struct ListingCollection: Hashable {
    let title: String
    let items: [ListingItem]
    
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
