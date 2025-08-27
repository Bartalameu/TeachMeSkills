//
//  CustomButton.swift
//  homework_11
//
//  Created by Vadzim Pappkou on 05.08.2025.
//

import UIKit

class CustomButton: UIButton {
    
    init(title: String? = nil, image: UIImage? = nil, color: UIColor) {
        super.init(frame: .zero)
        
        if let image = image {
            let resizedImage = image.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
            self.setImage(resizedImage, for: .normal)
            self.tintColor = .white
            self.imageView?.contentMode = .scaleAspectFit
            self.imageView?.clipsToBounds = true
        }
        else if let title = title {
            self.setTitle(title, for: .normal)
            self.setTitleColor(.white, for: .normal)
        }
        backgroundColor = color
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = .systemFont(ofSize: 40, weight: .regular)
        clipsToBounds = true
        imageView?.contentMode = .scaleAspectFit
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
}




