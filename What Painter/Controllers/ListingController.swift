//
//  ListingController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 09.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class ListingController: UICollectionViewController {
    
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
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.category = categories[indexPath.row]
        
        return cell
    }
}

extension ListingController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width , height: 250)
    }
}

class PainterCategoryCell: CategoryCell {
    private let painterCell = "painterCell"
    
    override func setupViews() {
        super.setupViews()
        typesCollectionView.register(PainterCell.self, forCellWithReuseIdentifier: painterCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: painterCell, for: indexPath) as! PainterCell
        cell.item = category?.items?[indexPath.row]
        
        return cell
    }
     
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 120, height: 120)
    }
    
    private class PainterCell: TypeCell {
        override func setupViews() {
            imageView.layer.cornerRadius = self.frame.width / 2
            imageView.layer.borderColor =  UIColor.systemPink.cgColor
            imageView.layer.borderWidth = 2
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(imageView)
            addSubview(nameLabel)
            
            nameLabel.font = UIFont(name: "Marker Felt", size: 26)
            
            nameLabel.frame = CGRect(x: 0, y: frame.height - 30, width: frame.width, height: 40)
            imageView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        }
    }
}
