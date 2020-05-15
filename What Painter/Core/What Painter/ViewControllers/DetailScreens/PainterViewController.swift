//
//  PainterViewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 5/15/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation


class PainterViewController {
    var collections: [PainterCollection] {
        return _collections
    }
    
    fileprivate var _collections = [PainterCollection]()
    
    init() {
        generateCollections()
    }
}

extension PainterViewController {
    func generateCollections() {
        _collections = [
            PainterCollection(title: "Похожие писатели",
                              items: [PainterItem(image: "1", name: "Ван Гог"),
                                      PainterItem(image: "2", name: "да Винчи"),
                                      PainterItem(image: "3", name: "Пикасо"),
                                      PainterItem(image: "4", name: "Рафаэль")]),
            PainterCollection(title: "Картины",
                              items: [PainterImage(image: "1", name: "Звездная ночь"),
                                      PainterImage(image: "2", name: "Звездная ночь"),
                                      PainterImage(image: "3", name: "Звездная ночь"),
                                      PainterImage(image: "4", name: "Звездная ночь"),
                                      PainterImage(image: "5", name: "Звездная ночь"),
                                      PainterImage(image: "6", name: "Звездная ночь"),
                                      PainterImage(image: "7", name: "Звездная ночь"),
                                      PainterImage(image: "8", name: "Звездная ночь"),
                                      PainterImage(image: "9", name: "Звездная ночь"),
                                      PainterImage(image: "10", name: "Звездная ночь"),
                                      PainterImage(image: "11", name: "Звездная ночь")])
        ]
    }
}

class PainterSample: Painting, Hashable {
    static func == (lhs: PainterSample, rhs: PainterSample) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

class PainterItem: PainterSample {}

class PainterImage: PainterSample {}


struct PainterCollection: Hashable {
    let title: String
    let items: [PainterSample]
    
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
