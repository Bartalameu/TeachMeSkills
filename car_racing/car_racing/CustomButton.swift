//
//  CustomButton.swift
//  homework_11
//
//  Created by Vadzim Pappkou on 05.08.2025.
//

import UIKit

class CustomButton: UIButton {
    
    init(title: String? = nil, image: UIImage? = nil, color: UIColor? = nil) {
        super.init(frame: .zero)
        
        if let image = image {
            
            self.setImage(image, for: .normal)
            self.tintColor = .white
            self.imageView?.contentMode = .scaleAspectFit
            self.imageView?.clipsToBounds = true
            self.imageView?.transform = CGAffineTransform(scaleX: 3.5, y: 3.5)
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
        clipsToBounds = true
        imageView?.contentMode = .scaleAspectFit
        
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
}




