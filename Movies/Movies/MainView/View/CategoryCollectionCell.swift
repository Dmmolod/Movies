//
//  CategoryCollectionCell.swift
//  Movies
//
//  Created by Дмитрий Молодецкий on 04.07.2022.
//

import Foundation
import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    var categoryTitle: UILabel = {
        let categoryTitle = UILabel()
        categoryTitle.font = .systemFont(ofSize: 15)
        categoryTitle.backgroundColor = .systemBackground
        categoryTitle.textAlignment = .center
        categoryTitle.layer.cornerRadius = 5
        categoryTitle.layer.borderWidth = 2
        categoryTitle.layer.borderColor = UIColor.label.cgColor
        categoryTitle.layer.masksToBounds = true
        return categoryTitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(categoryTitle)
        categoryTitle.anchor(top: topAnchor,
                             bottom: bottomAnchor,
                             leading: leadingAnchor,
                             trailing: trailingAnchor)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(text: String) {
        categoryTitle.text = text
    }
}
