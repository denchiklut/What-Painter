//
//  RootViewController.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 14.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = createLayout()
        
        let collectionVCConfiguration = GenericCollectionViewControllerConfiguration(
            collectionViewBackgroundColor: .tertiarySystemFill,
            collectionViewLayout: layout,
            hideScrollIndicators: false,
            hidesNavigationBar: false,
            headerNibName: nil
        )
        
        let hc = HomeController(configuration: collectionVCConfiguration)
        
        let homeNavController = UINavigationController(rootViewController: hc)
        homeNavController.navigationBar.tintColor = .systemPink
        homeNavController.navigationBar.barTintColor = UIColor(hexString: "161616")
        homeNavController.tabBarItem.image = UIImage(systemName: "play")
        homeNavController.tabBarItem.selectedImage = UIImage(systemName: "play.fill")
        homeNavController.tabBarItem.title = "Play"
        
        
        let listingNavController = UINavigationController(rootViewController: GenericListingViewController())
        listingNavController.navigationBar.tintColor = .systemPink
        listingNavController.tabBarItem.image = UIImage(systemName: "rectangle.on.rectangle.angled")
        listingNavController.tabBarItem.selectedImage = UIImage(systemName: "rectangle.fill.on.rectangle.angled.fill")
        listingNavController.tabBarItem.title = "Learn"
        
        tabBar.tintColor = .systemPink
        
        viewControllers = [listingNavController, homeNavController]
    }
    
    private func createLayout() -> UICollectionViewLayout {
        // Todo Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated((view.frame.width / 3) - 16), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .flexible(0), top: .flexible(0), trailing: .flexible(8), bottom: .flexible(0))
        
        // Todo group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Todo section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        section.interGroupSpacing = 16
        
        // Todo layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
