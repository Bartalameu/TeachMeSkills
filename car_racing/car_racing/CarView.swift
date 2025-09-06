//
//  CarView.swift
//  car_racing
//
//  Created by Vadzim Pappkou on 04.09.2025.
//

import UIKit

class CarView: UIImageView {
    
    private let imageView: UIImageView
    

    
    init(imageView: UIImageView) {
        self.imageView = imageView
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func  configureView() {
        clipsToBounds = true
        backgroundColor = .none
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        self.addShadow()

        [imageView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview(imageView)
        }
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
        ])
    }
    
    private func addShadow(color: UIColor = .black,
                   opacity: Float = 0.8,
                   offset: CGSize = CGSize(width: 3, height: 8),
                   radius: CGFloat = 8) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        
    }
    
    
    
}
