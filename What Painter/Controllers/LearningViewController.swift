//
//  LearningViewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 05.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class LearningViewController: UIViewController {
    @IBOutlet weak var paintersCollectionView: UICollectionView!
    
    var painters = Painter.fetchPainters()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintersCollectionView.dataSource = self
        
        let layout = paintersCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 200.0, height: 140)
        layout.estimatedItemSize = CGSize(width: 200.0, height: 140)
    }
}

extension LearningViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return painters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = paintersCollectionView.dequeueReusableCell(withReuseIdentifier: K.paintersCollectionCell, for: indexPath) as! PaintersCollectionCell
        let painter = painters[indexPath.row]
        cell.painter = painter
        return cell
    }
}
