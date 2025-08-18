//
//  ItemCustomCell.swift
//  lesson_13(UICollectionView)
//
//  Created by Vadzim Pappkou on 13.08.2025.
//

import UIKit

class ItemCustomCell: UICollectionViewCell {
    static let reusId = "ItemCustomCell"
    
    let titleLabel = UILabel()
    let ImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(item: Item) {
        titleLabel.text = item.title
        ImageView.image = UIImage (systemName: item.imageName)
    }
    
    private func setupUI () {
        contentView.backgroundColor = UIColor.systemGray3
        contentView.layer.cornerRadius = 16
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        
        ImageView.contentMode = .scaleAspectFit
        ImageView.clipsToBounds = true
        
        [titleLabel, ImageView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
       
        
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: ImageView.bottomAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
        ])
    }
    
}

