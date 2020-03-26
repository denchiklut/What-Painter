//
//  PainterController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 07.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit


class DescribeController: UICollectionViewController {
    static let titleElementKind = UICollectionView.elementKindSectionHeader
    
    var paintings = [
        Painting(image: "1", name: "a"),
        Painting(image: "2", name: "b"),
        Painting(image: "3", name: "c"),
        Painting(image: "4", name: "d"),
        Painting(image: "5", name: "e"),
        Painting(image: "6", name: "f"),
        Painting(image: "1", name: "a"),
        Painting(image: "2", name: "b"),
        Painting(image: "3", name: "c"),
        Painting(image: "4", name: "d"),
        Painting(image: "5", name: "e"),
        Painting(image: "6", name: "f")
    ]
    

    private let numberOfItemsPerRow: CGFloat = 3
    private let lineSpacing: CGFloat = 2
    private let interItemSpacing: CGFloat = 2
    private let padding: CGFloat = 0
    
    var categories = ["Action", "Drama"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(PaintersCollection.self, forCellWithReuseIdentifier: PaintersCollection.reuseIdentifier)
        collectionView.register(PaintingCell.self, forCellWithReuseIdentifier: PaintingCell.reuseIdentifier)
        collectionView.register(TitleSupplementaryView.self,
                                forSupplementaryViewOfKind: DescribeController.titleElementKind,
                                withReuseIdentifier: TitleSupplementaryView.reuseIdentifier)
        collectionView.register(DetailHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: DetailHeader.reuseIdentifier)

        
        let layout = StrechyHeaderLayout()
        layout.minimumInteritemSpacing = interItemSpacing
        layout.sectionInset = UIEdgeInsets.zero
        layout.minimumLineSpacing = lineSpacing

        collectionView.collectionViewLayout = layout
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.backgroundColor = UIColor(hexString: "2C2C2E")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
}

// MARK: - Header
extension DescribeController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailHeader.reuseIdentifier , for: indexPath) as! DetailHeader
            return header
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleSupplementaryView.reuseIdentifier, for: indexPath) as! TitleSupplementaryView
        header.label.text = categories[indexPath.section]
        return header
    }
}

// MARK: - Cells
extension DescribeController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return paintings.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaintersCollection.reuseIdentifier, for: indexPath) as! PaintersCollection
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaintingCell.reuseIdentifier, for: indexPath) as! PaintingCell
        cell.painting = paintings[indexPath.row]

        return cell
        
    }
}

extension DescribeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return .init(width: collectionView.bounds.width, height: 130)
        }
        
        let width = (collectionView.frame.width - (numberOfItemsPerRow - 1) * interItemSpacing) / numberOfItemsPerRow  - padding
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return .init(width: collectionView.bounds.width, height: 560)
        }
        return .init(width: collectionView.bounds.width, height: 44)
    }
}

