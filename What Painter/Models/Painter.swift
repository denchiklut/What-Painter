//
//  Painter.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 05.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class Painter {
    let image: UIImage
    let name: String
    let color: UIColor
    
    init(name: String, image: UIImage, color: UIColor) {
        self.name = name
        self.image = image
        self.color = color
    }
    
    static func fetchPainters() -> [Painter] {
        return [
            Painter(name: "Леонардо да Винчи", image: UIImage(named: "1")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.8)),
            Painter(name: "Ван Гог", image: UIImage(named: "4")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.8)),
            Painter(name: "Рафаэль", image: UIImage(named: "10")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.8)),
            Painter(name: "Мунк", image: UIImage(named: "8")!, color: UIColor(red: 102/255.0, green: 175/255.0, blue: 102/255.0, alpha: 0.8)),
            Painter(name: "Леонардо да Винчи", image: UIImage(named: "1")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.8)),
            Painter(name: "Ван Гог", image: UIImage(named: "4")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.8)),
            Painter(name: "Рафаэль", image: UIImage(named: "10")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.8)),
            Painter(name: "Мунк", image: UIImage(named: "8")!, color: UIColor(red: 102/255.0, green: 175/255.0, blue: 102/255.0, alpha: 0.8))
        ]
    }
}
