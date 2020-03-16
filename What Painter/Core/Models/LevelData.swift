//
//  LevelData.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 29.02.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation
import RealmSwift

class Level: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var image: String = ""
    
    let images = List<Paintings>()
}
