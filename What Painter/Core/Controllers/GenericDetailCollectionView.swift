//
//  PainterController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 07.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit


class GenericDetailCollectionView: UIViewController {
    static let titleElementKind = UICollectionView.elementKindSectionHeader
    
    let detailController = DetailController()
    var paintings = [Painting]()
    var painters = [Painter]()
    var collectionView: UICollectionView! = nil
    
    private let numberOfItemsPerRow: CGFloat = 3
    private let lineSpacing: CGFloat = 2
    private let interItemSpacing: CGFloat = 2
    private let padding: CGFloat = 0
    
    var categories = ["Action", "Drama"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintings = detailController.paintings
        painters = detailController.painters
        
        let layout = StrechyHeaderLayout()
        layout.minimumInteritemSpacing = interItemSpacing
        layout.sectionInset = UIEdgeInsets.zero
        layout.minimumLineSpacing = lineSpacing
        layout.sectionInsetReference = .fromSafeArea

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(hexString: "2C2C2E")
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        collectionView.register(PaintersCollection.self, forCellWithReuseIdentifier: PaintersCollection.reuseIdentifier)
        collectionView.register(PaintingCell.self, forCellWithReuseIdentifier: PaintingCell.reuseIdentifier)
        collectionView.register(TitleSupplementaryView.self,
                                forSupplementaryViewOfKind: GenericDetailCollectionView.titleElementKind,
                                withReuseIdentifier: TitleSupplementaryView.reuseIdentifier)
        collectionView.register(DetailHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: DetailHeader.reuseIdentifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
}

// MARK: - Header
extension GenericDetailCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
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
extension GenericDetailCollectionView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return paintings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaintersCollection.reuseIdentifier, for: indexPath) as! PaintersCollection
            cell.painters = painters
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaintingCell.reuseIdentifier, for: indexPath) as! PaintingCell
        cell.painting = paintings[indexPath.row]

        return cell
        
    }
}

extension GenericDetailCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return .init(width: collectionView.bounds.width, height: 130)
        }
        
        if collectionView.frame.width > 800 {
            let width = (collectionView.frame.width - (numberOfItemsPerRow * 2 - 1) * interItemSpacing) / numberOfItemsPerRow / 2  - padding
            return .init(width: width, height: width)
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

