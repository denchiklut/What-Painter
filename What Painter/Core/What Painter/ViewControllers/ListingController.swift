//
//  ListingController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 09.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class ListingController: UICollectionViewController {
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    private let cellId = "cellId"
    private let painterCell = "painterCell"
    
    let categories = Category.sampleCategories()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .quaternarySystemFill
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(PainterCategoryCell.self, forCellWithReuseIdentifier: painterCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: painterCell, for: indexPath) as! PainterCategoryCell
            cell.category = categories[indexPath.row]
            cell.delegate = self
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.category = categories[indexPath.row]
        
        return cell
    }
}

extension ListingController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
             return .init(width: view.frame.width , height: 180)
        }
        return .init(width: view.frame.width , height: 250)
    }
}

extension ListingController: PainterCellProtocol {
    func didSelect(_ sender: PainterCategoryCell) {
        let layput = UICollectionViewFlowLayout()
        
        let vc = DescribeController(collectionViewLayout: layput)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
