//
//  HoveViewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 14.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class HomeController: GenericCollectionViewController<LevelCell, Level> {
    var levelsManager = LevelsManager()
    var levels = [Level]()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        collectionView.reloadData()
    }
    
    override init(configuration: GenericCollectionViewControllerConfiguration) {
        super.init(configuration: configuration)
        levels = levelsManager.levels
        items = levels
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "What Painter"
        
        collectionView.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        levelsManager.currentLevel = indexPath.row
        let vc = LevelPreviewController(levelsManager: levelsManager)
    
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

