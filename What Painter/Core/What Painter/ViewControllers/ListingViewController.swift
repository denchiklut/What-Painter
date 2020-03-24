//
//  OrthogonalViewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 21.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation

struct ListingItem: Hashable {
    let title: String
    let image: String
    let category: String
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

struct ListingCollection: Hashable {
    let title: String
    let videos: [ListingItem]
    
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

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
                              videos: [ListingItem(title: "Леонардо да Винчи", image: "1", category: ""),
                                       ListingItem(title: "Ван Гог", image: "2", category: ""),
                                       ListingItem(title: "Вермеер", image: "3", category: ""),
                                       ListingItem(title: "Рафаэль", image: "4", category: ""),
                                       ListingItem(title: "Пабло Пикасо", image: "5", category: ""),
                                       ListingItem(title: "Сальвадор Дали", image: "6", category: "")]),
            
            ListingCollection(title: "Музеи",
                              videos: [ListingItem(title: "Лувр", image: "22", category: "Париж"),
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
                              videos: [ListingItem(title: "Импрессионизм", image: "7", category: "XIX — XX"),
                                       ListingItem(title: "Экспрессионизм", image: "8", category: "XX"),
                                       ListingItem(title: "Кубизм", image: "9", category: "XX"),
                                       ListingItem(title: "Сюрреализм", image: "10", category: "XX"),
                                       ListingItem(title: "Романтизм", image: "11", category: "XVIII — XIX"),
                                       ListingItem(title: "Фовизм", image: "12", category: "XIX — XX"),
                                       ListingItem(title: "Реализм", image: "13", category: "XIX — XX"),
                                       ListingItem(title: "Барокко", image: "14", category: "XVII—XVIII")]),
            
            ListingCollection(title: "Странны",
                              videos: [ListingItem(title: "Италия", image: "14", category: " "),
                                       ListingItem(title: "Франция", image: "18", category: " "),
                                       ListingItem(title: "Британия", image: "19", category: " "),
                                       ListingItem(title: "США", image: "20", category: " "),
                                       ListingItem(title: "Россия", image: "21", category: " "),
                                       ListingItem(title: "Австрия", image: "1", category: " "),
                                       ListingItem(title: "Германия", image: "2", category: " "),
                                       ListingItem(title: "Испания", image: "3", category: " "),
                                       ListingItem(title: "Нидерланды", image: "4", category: " "),
                                       ListingItem(title: "Швеция", image: "5", category: " "),
                                       ListingItem(title: " Япония", image: "6", category: " ")])
        ]
    }
}
