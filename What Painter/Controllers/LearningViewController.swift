//
//  LearningViewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 05.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class LearningViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var paintersCollectionView: UICollectionView!
    
    var painters = Painter.fetchPainters()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintersCollectionView.dataSource = self
        paintersCollectionView.delegate = self
        paintersCollectionView.register(UINib(nibName: K.painterCell, bundle: nil), forCellWithReuseIdentifier: K.paintersCellIdentifire)
        
        let layout = paintersCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = CGSize(width: 140, height: 220)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.descriptoinSegue, sender: self)
    }
}

extension LearningViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return painters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = paintersCollectionView.dequeueReusableCell(withReuseIdentifier: K.paintersCellIdentifire, for: indexPath) as! PainterCell
        let painter = painters[indexPath.row]
        cell.painter = painter

        return cell
    }
}
