//
//  PainterController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 07.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

private let numberOfItemsPerRow: CGFloat = 3
private let lineSpacing: CGFloat = 6
private let interItemSpacing: CGFloat = 6
private let padding: CGFloat = 6

class DescribeController: UICollectionViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "2C2C2E")
        collectionView.backgroundColor = .clear
        
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(PaintingCell.self, forCellWithReuseIdentifier: K.reusablePaintingCell)
        collectionView.register(DetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: K.detailHeaderIdentofire)
        
        setupCollectionView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func setupCollectionView() {
        let width = (collectionView.frame.width - (numberOfItemsPerRow - 1) * interItemSpacing) / numberOfItemsPerRow  - padding
        let height = width

        let collectionViewFlowLayout = StrechyHeaderLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = lineSpacing
        collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing

        collectionViewFlowLayout.headerReferenceSize = CGSize(width: collectionView.frame.width, height: 560)
        collectionViewFlowLayout.sectionInset = .init(top: 40, left: padding, bottom: 80, right: padding)


        collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
    }
}

// MARK: - Header
extension DescribeController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.detailHeaderIdentofire , for: indexPath)
        header.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 560)
        return header
    }
}
 
// MARK: - DataSource
extension DescribeController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        paintings.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.reusablePaintingCell, for: indexPath) as! PaintingCell
        cell.painting = paintings[indexPath.row]
        
        return cell
    }
}

