//
//  PreviewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 5/17/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class PaintingPreviewController: UIViewController {
    var imageView : UIImageView!
    var item: PainterSample?
    
    override func loadView() {
        super.loadView()

        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        imageView.contentMode = .scaleAspectFill
        
        self.imageView = imageView
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .black
        
        if let safeitem = item {
           imageView.image = UIImage(named: safeitem.image)
        }
    }
    
    init(item: PainterSample?) {
        super.init(nibName: nil, bundle: nil)
        self.item = item
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
