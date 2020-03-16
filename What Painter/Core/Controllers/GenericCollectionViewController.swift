//
//  GenericCollectionView.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 14.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

struct GenericCollectionViewControllerConfiguration {
    let collectionViewBackgroundColor: UIColor
    let collectionViewLayout: UICollectionViewLayout
    let hideScrollIndicators: Bool
    let hidesNavigationBar: Bool
    let headerNibName: String?
}


class GenericCollectionViewController<T: GenericCollectionViewCell<U>, U >: UICollectionViewController {
    let cellID = "cellID"
    let configuration: GenericCollectionViewControllerConfiguration
    var items = [U]()
    
    init(configuration: GenericCollectionViewControllerConfiguration) {
        self.configuration = configuration
        let layout = configuration.collectionViewLayout
        super.init(collectionViewLayout: layout)
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = configuration.collectionViewBackgroundColor
        collectionView.register(T.self, forCellWithReuseIdentifier: cellID)
         
        if configuration.hideScrollIndicators {
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
        }
        
        if let headerNib = configuration.headerNibName {
            collectionView?.register(UINib(nibName: headerNib, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerNib)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (configuration.hidesNavigationBar) {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (configuration.hidesNavigationBar) {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! GenericCollectionViewCell<U>
        cell.item = items[indexPath.row]
        
        return cell
    }
}

class GenericCollectionViewCell<U>: UICollectionViewCell {
    var item: U!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
