//
//  GenericOrthogonalViewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 21.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class GenericListingViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case painter, museam, mode, country
    }
    
    let videosController = ListingViewController()
    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<ListingCollection, ListingItem>! = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<ListingCollection, ListingItem>! = nil
    static let titleElementKind = "title-element-kind"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
}

extension GenericListingViewController {
    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { fatalError("unknown section kind") }
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupHeight: NSCollectionLayoutDimension
            let groupWidth: NSCollectionLayoutDimension
            
            switch sectionKind {
            case .painter:
                groupHeight = NSCollectionLayoutDimension.absolute(110)
                groupWidth = NSCollectionLayoutDimension.absolute(110)
            case .museam:
                groupHeight = NSCollectionLayoutDimension.absolute(150)
                groupWidth = NSCollectionLayoutDimension.absolute(250)
            case .mode:
                groupHeight = NSCollectionLayoutDimension.absolute(50)
                groupWidth = NSCollectionLayoutDimension.absolute(170)
            default:
                groupHeight = NSCollectionLayoutDimension.absolute(220)
                groupWidth = NSCollectionLayoutDimension.absolute(150)
            }
            
            let groupSize = NSCollectionLayoutSize(widthDimension: groupWidth, heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            section.interGroupSpacing = sectionKind == .painter ? 10 : 15
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
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
        collectionView.delegate = self
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        collectionView.register(ListingCell.self, forCellWithReuseIdentifier: ListingCell.reuseIdentifier)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.reuseIdentifier)
        collectionView.register(ModeCell.self, forCellWithReuseIdentifier: ModeCell.reuseIdentifier)
        collectionView.register(MuseamCell.self, forCellWithReuseIdentifier: MuseamCell.reuseIdentifier)
        collectionView.register(TitleSupplementaryView.self,
                                forSupplementaryViewOfKind: GenericListingViewController.titleElementKind,
                                withReuseIdentifier: TitleSupplementaryView.reuseIdentifier)
    }
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<ListingCollection, ListingItem> (collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: ListingItem) -> UICollectionViewCell? in
            guard let sectionKind = Section(rawValue: indexPath.section) else { fatalError("unknown section kind") }
            
            switch sectionKind {
            case .painter:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseIdentifier, for: indexPath) as? ImageCell else {
                    fatalError("Cannot create new cell")
                }
                cell.imageView.image = UIImage(named:  item.image)
                return cell
            case .museam:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MuseamCell.reuseIdentifier, for: indexPath) as? MuseamCell else {
                    fatalError("Cannot create new cell")
                }
                cell.imageView.image = UIImage(named: item.image)
                cell.titleLabel.text = item.title
                cell.categoryLabel.text = item.category
 
                return cell
            case .mode:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ModeCell.reuseIdentifier, for: indexPath) as? ModeCell else {
                    fatalError("Cannot create new cell")
                }
                guard let modeItem = item as? ModeItem else { fatalError("Cannot create ModeItem") }
                cell.imageView.image = UIImage(named: modeItem.image)
                cell.titleLabel.text = modeItem.title
                cell.bgColor = modeItem.color
                
                return cell
            default:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListingCell.reuseIdentifier, for: indexPath) as? ListingCell else {
                    fatalError("Cannot create new cell")
                }
                cell.imageView.image = UIImage(named: item.image)
                cell.titleLabel.text = item.title
                cell.categoryLabel.text = item.category
                
                return cell
            }
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
            currentSnapshot.appendItems(collection.items)
        }
        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }
}

extension GenericListingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dc = DescribeController(collectionViewLayout: UICollectionViewLayout())
        navigationController?.pushViewController(dc, animated: true)
    }
}
