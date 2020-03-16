////
////  LevelsController.swift
////  What Painter
////
////  Created by Александров Денис Александрович on 03.03.2020.
////  Copyright © 2020 Александров Денис Александрович. All rights reserved.
////
//
//import UIKit
//import RealmSwift
//
//private let reuseIdentifier = K.cellIdentifier
//
//class LevelsController: UICollectionViewController {
//
//    let realm = try! Realm()
//    var levelsManager = LevelsManager()
//
//    var levels = [Level]()
//
//    var selectedLevel = 0
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
//        self.collectionView!.register(UINib(nibName: K.cellNibName, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
//
//        let collectionViewWidth = collectionView?.frame.width
//        let itemWidth = (collectionViewWidth! - 10) / 3
//
//        let layout = collectionViewLayout as! UICollectionViewFlowLayout
//        layout.estimatedItemSize = CGSize(width: itemWidth, height: 140)
//
//        levels = levelsManager.levels
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        self.collectionView.reloadData()
//        navigationController?.isNavigationBarHidden = false
//        self.tabBarController?.tabBar.isHidden = false
//    }
//
//    // MARK: UICollectionViewDataSource
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return levels.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LevelCell1
//        cell.data = levels[indexPath.row]
//
//        return cell
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        selectedLevel = indexPath.row
//        levelsManager.currentLevel = selectedLevel
//        self.performSegue(withIdentifier: K.previewSegue, sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == K.previewSegue {
//            let dc = segue.destination as! LevelPreviewController
//
//            dc.levelsManager = levelsManager
//        }
//    }
//
//}
