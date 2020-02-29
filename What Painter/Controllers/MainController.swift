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
        LevelData(title: "Level 1", image: "monoLiza"),
        LevelData(title: "Level 2", image: "monoLiza"),
        LevelData(title: "Level 3", image: "monoLiza"),
        LevelData(title: "Level 4", image: "monoLiza"),
        LevelData(title: "Level 5", image: "monoLiza"),
        LevelData(title: "Level 6", image: "monoLiza"),
        LevelData(title: "Level 7", image: "monoLiza"),
        LevelData(title: "Level 8", image: "monoLiza"),
        LevelData(title: "Level 9", image: "monoLiza"),
        LevelData(title: "Level 10", image: "monoLiza"),
        LevelData(title: "Level 11", image: "monoLiza"),
        LevelData(title: "Level 12", image: "monoLiza")
    ]
    
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
}
