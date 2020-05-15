//
//  GenericPainterViewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 5/15/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class GenericPainterView: UIViewController {
    static let textTitleElementKind = "text-header"
    
    let painterVC = PainterViewController()

    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<PainterCollection, PainterSample>! = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<PainterCollection, PainterSample>! = nil
    private let numberOfItemsPerRow: Int = 3
    private let interSectionSpacing: CGFloat = 50
    private let padding : CGFloat = 1
    
    enum Section: Int, CaseIterable {
        case painters, main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
    }
}

extension GenericPainterView {
    func createLayout() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = self.interSectionSpacing
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?  in
             guard let sectionKind = Section(rawValue: sectionIndex) else { fatalError("Unknown section kind") }
             
             let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
             let item = NSCollectionLayoutItem(layoutSize: itemSize)
             item.contentInsets = NSDirectionalEdgeInsets(top: self.padding, leading: self.padding, bottom: self.padding, trailing: self.padding)
            
             let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/CGFloat(self.numberOfItemsPerRow)))
             let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: Int(self.numberOfItemsPerRow))
            
             let section = NSCollectionLayoutSection(group: group)
             section.orthogonalScrollingBehavior = sectionKind == .painters ? .continuousGroupLeadingBoundary : .none
             let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: sectionKind == .painters ? .absolute(160): .absolute(44))
             
             let textHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: GenericPainterView.textTitleElementKind, alignment: .top)
             
             section.boundarySupplementaryItems = [textHeader]
             return section
        }, configuration: config)

        return layout
    }
}

extension GenericPainterView {
    func configureHierarchy() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        collectionView.register(PaintingCell.self, forCellWithReuseIdentifier: PaintingCell.reuseIdentifier)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.reuseIdentifier)
        collectionView.register(TitleSupplementaryView.self,
                                forSupplementaryViewOfKind: GenericPainterView.textTitleElementKind,
                                withReuseIdentifier: TitleSupplementaryView.reuseIdentifier)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<PainterCollection, PainterSample> (collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: PainterSample) -> UICollectionViewCell? in
            guard let sectionKind = Section(rawValue: indexPath.section) else { fatalError("Unknown section kind") }
            
            switch sectionKind {
                case .painters:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseIdentifier, for: indexPath) as? ImageCell else {
                        fatalError("Cannot create new cell")
                    }
                    cell.imageView.image = UIImage(named: item.image)
                    return cell
                default:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaintingCell.reuseIdentifier, for: indexPath) as? PaintingCell else {
                        fatalError("Cannot create new cell")
                    }
                    cell.painting = item
                    return cell
            }
        }
        
        dataSource.supplementaryViewProvider = { [weak self] (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let self = self, let snapshot = self.currentSnapshot else { return nil }
            
            if let titleSupplementary = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleSupplementaryView.reuseIdentifier, for: indexPath) as? TitleSupplementaryView {
                
                let painterCategory = snapshot.sectionIdentifiers[indexPath.section]
                titleSupplementary.label.text = painterCategory.title
                
                return titleSupplementary
            } else {
                fatalError("Cannot create new supplementary")
            }
        }
        
        currentSnapshot = NSDiffableDataSourceSnapshot<PainterCollection, PainterSample>()
        painterVC.collections.forEach {
            let collection = $0
            currentSnapshot.appendSections([collection])
            currentSnapshot.appendItems(collection.items)
        }
        dataSource.apply(currentSnapshot, animatingDifferences: false)
        
    }
}

