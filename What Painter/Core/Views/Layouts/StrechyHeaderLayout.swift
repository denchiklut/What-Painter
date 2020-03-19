 //
 //  StrechyHeaderLayout.swift
 //  What Painter
 //
 //  Created by Александров Денис Александрович on 09.03.2020.
 //  Copyright © 2020 Александров Денис Александрович. All rights reserved.
 //
 
 import UIKit
 
 class StrechyHeaderLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ attribute in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader && attribute.indexPath.section == 0 {
                guard let collectionView =  collectionView else { return }
                let width = collectionView.frame.width
                let offsetY = collectionView.contentOffset.y

                if offsetY > 0 {
                    return
                }

                let height = attribute.frame.height - offsetY
                attribute.frame = CGRect(x: 0, y: offsetY, width: width, height: height)
            }
        })
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
 }
