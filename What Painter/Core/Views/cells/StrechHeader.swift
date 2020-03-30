//
//  TitleSumplementary.swift
//  What Painter
//
//  Created by Александров Денис Александрович on 21.03.2020.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import UIKit

class StrechHeader: UICollectionReusableView {
    static let reuseIdentifier = "strech-title-supplementary-reuse-identifier"
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension StrechHeader {
    func configure() {
           addSubview(label)
           label.translatesAutoresizingMaskIntoConstraints = false
           label.adjustsFontForContentSizeCategory = true
           label.font = UIFont.preferredFont(forTextStyle: .title3)
           
           let inset = CGFloat(10)
           NSLayoutConstraint.activate([
               label.leadingAnchor.constraint(equalTo: leadingAnchor),
               label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
               label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
               label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
           ])
       }
}
