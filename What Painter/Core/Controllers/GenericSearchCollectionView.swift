//
//  GenericSearchCollectionView.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 27.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class GenericSearchCollectionView: UIViewController {
    static let painterTitleElementKind = "painter-header-element-kind"
    static let defaultTitleElementKind = "default-header-element-kind"
    
    enum Section: Int, CaseIterable {
        case painter, main
    }
    
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
    }
}

extension GenericSearchCollectionView {
    func createLayput() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 50
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
            
            let columns = layoutEnvironment.container.effectiveContentSize.width > 800 ? 6 : 3
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/CGFloat(columns)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
            
            let section = NSCollectionLayoutSection(group: group)
                    
            return section
        }, configuration: config)
        
        return layout
    }
}

extension GenericSearchCollectionView {
    func configureHierarchy() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayput())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension GenericSearchCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
}
