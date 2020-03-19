//
//  PainterCategoryCell.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 19.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

protocol PainterCellProtocol {
    func didSelect(_ sender: PainterCategoryCell)
}

class PainterCategoryCell: CategoryCell {
    private let painterCell = "painterCell"
    
    var delegate: PainterCellProtocol?
    
    override func setupViews() {
        super.setupViews()
        typesCollectionView.register(PainterCell.self, forCellWithReuseIdentifier: painterCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: painterCell, for: indexPath) as! PainterCell
        cell.item = category?.items?[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 120, height: 120)
    }
   
}
