//
//  MainMenuController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 29.02.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

private let reuseIdentifier = K.cellIdentifier

class MainController: UICollectionViewController {
    
    var levels: [LevelData] = [
        LevelData(title: "Разминка", image: "1"),
        LevelData(title: "Мировые шедевры", image: "2"),
        LevelData(title: "Франция", image: "3"),
        LevelData(title: "Лувр", image: "4")
    ]
    
    var selectedLevel = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UINib(nibName: K.cellNibName, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        let collectionViewWidth =  collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - 10) / 3
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = CGSize(width: itemWidth, height: 140)
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LevelCell
        cell.data = levels[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedLevel = indexPath.row
        self.performSegue(withIdentifier: K.previewSegue, sender: self)
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.previewSegue {
            let levelData = levels[selectedLevel]
            let dc = segue.destination as! LevelPreviewController
            
            dc.data = levelData
        }
    }
}
