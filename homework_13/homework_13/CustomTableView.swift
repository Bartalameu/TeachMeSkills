//
//  CustomTableView.swift
//  homework_13
//
//  Created by Vadzim Pappkou on 12.08.2025.
//

import UIKit

class CustomTableView: UITableViewCell {
    
    var tileLabel: UILabel = UILabel ()
    var detailLabel: UILabel = UILabel ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLayout () {
        
        tileLabel.font = UIFont.systemFont(ofSize: 24)
        tileLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        detailLabel.font = UIFont.systemFont(ofSize: 24)
        detailLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        let infoStack = UIStackView (arrangedSubviews: [tileLabel, detailLabel])
        infoStack.axis = .vertical
        infoStack.spacing = 20
        
        [infoStack].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
            
        }
        
        NSLayoutConstraint.activate([tileLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                                     tileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     detailLabel.topAnchor.constraint(equalTo: tileLabel.bottomAnchor, constant: 20),
                                     detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -20),
                                     
                                    ])
        
    }
        
    }
    
    
    
