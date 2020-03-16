//
//  Painter.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 05.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

class Painter {
    let image: String
    let name: String
    
    var paintings: [Painting]
    
    init(name: String, image: String, paintings: [Painting] ) {
        self.name = name
        self.image = image
        self.paintings = paintings
    }
}
