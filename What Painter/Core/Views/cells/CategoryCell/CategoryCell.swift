//
//  CategoryCell.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 09.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    private let cellId = "typeCellId"
   
    var category: Category?  {
        didSet {
            if let name = category?.name {
                nameLabel.text = name
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let typesCollectionView: UICollectionView = {
        let layoyt = StrechyHeaderLayout()
        layoyt.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoyt)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupViews() {
        let labelView = UIView()
        labelView.addSubview(nameLabel)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelView)
        addSubview(typesCollectionView)
        
        typesCollectionView.dataSource = self
        typesCollectionView.delegate = self
        typesCollectionView.showsHorizontalScrollIndicator = false
        typesCollectionView.register(TypeCell.self, forCellWithReuseIdentifier: cellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": labelView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": typesCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)][v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": labelView, "v1": typesCollectionView]))
    }
}

extension CategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = category?.items?.count {
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TypeCell
        cell.item = category?.items?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
}


extension CategoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: frame.height - 62)
    }
}

class TypeCell: UICollectionViewCell {
    var item: CategoryItem? {
        didSet {
            if let safeItem = item {
                imageView.image = UIImage(named: safeItem.image)
                nameLabel.text = safeItem.name
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        
        iv.image = UIImage(named: "1")
        iv.contentMode = .scaleAspectFill
        
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 10
        
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.frame =  CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        nameLabel.frame = CGRect(x: 0, y: frame.height - 50, width: frame.width, height: 40)
    }
}
