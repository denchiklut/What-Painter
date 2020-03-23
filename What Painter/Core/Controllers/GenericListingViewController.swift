//
//  GenericOrthogonalViewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 21.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class GenericListingViewController: UIViewController {
    
    let videosController = ListingViewController()
    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<ListingCollection, ListingItem>! = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<ListingCollection, ListingItem>! = nil
    static let titleElementKind = "title-element-kind"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "What Painter"
        configureHierarchy()
        configureDataSource()
    }
}

extension GenericListingViewController {
    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupHeight = sectionIndex == 0 ? NSCollectionLayoutDimension.absolute(150) : NSCollectionLayoutDimension.absolute(250)
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 20
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .estimated(44))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: GenericListingViewController.titleElementKind,
                alignment: .top)
            section.boundarySupplementaryItems = [titleSupplementary]
            return section
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
        return layout
    }
}

extension GenericListingViewController {
    func configureHierarchy() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        collectionView.register(ListingCell.self, forCellWithReuseIdentifier: ListingCell.reuseIdentifier)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.reuseIdentifier)
        collectionView.register(TitleSupplementaryView.self,
                                forSupplementaryViewOfKind: GenericListingViewController.titleElementKind,
                                withReuseIdentifier: TitleSupplementaryView.reuseIdentifier)
    }
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<ListingCollection, ListingItem> (collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: ListingItem) -> UICollectionViewCell? in
            
            if indexPath.section == 0 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseIdentifier, for: indexPath) as? ImageCell else {
                    fatalError("Cannot create new cell")
                }
                cell.imageView.image = UIImage(named:  item.image)
                return cell
            }
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListingCell.reuseIdentifier, for: indexPath) as? ListingCell else {
                fatalError("Cannot create new cell")
            }
            cell.imageView.image = UIImage(named: item.image)
            cell.titleLabel.text = item.title
            cell.categoryLabel.text = item.category
            
            return cell
        }
        
        dataSource.supplementaryViewProvider = { [weak self] (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let self = self, let snapshot = self.currentSnapshot else { return nil }
            
            if let titleSupplementary = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleSupplementaryView.reuseIdentifier, for: indexPath) as? TitleSupplementaryView {
                
                let videoCategory = snapshot.sectionIdentifiers[indexPath.section]
                titleSupplementary.label.text = videoCategory.title
                
                return titleSupplementary
            } else {
                fatalError("Cannot create new supplementary")
            }
        }
        
        currentSnapshot = NSDiffableDataSourceSnapshot<ListingCollection, ListingItem>()
        videosController.collections.forEach {
            let collection = $0
            currentSnapshot.appendSections([collection])
            currentSnapshot.appendItems(collection.videos)
        }
        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }
}
