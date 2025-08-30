//
//  ButtonsPanelViewController.swift
//  homework_17(Animation)
//
//  Created by Vadzim Pappkou on 26.08.2025.
//

import UIKit

class ButtonsPanelView: UIView {
    
    var onMoveLeft: (() -> Void)?
    var onMoveRight: (() -> Void)?
    var onMoveUp: (() -> Void)?
    var onMoveDown: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemGray
        setUP()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let toLeftButton: CustomButton = {
        let button = CustomButton(image: UIImage(systemName: "arrowshape.left.fill"), color: .systemMint)
        
        return button
    }()
    
    private let toRightButton: CustomButton = {
        let button = CustomButton(image: UIImage(systemName: "arrowshape.right.fill"), color: .systemMint)

        return button
    }()
    
    private let toUpButton: CustomButton = {
        let button = CustomButton(image: UIImage(systemName: "arrowshape.up.fill"), color: .systemMint)

        return button
    }()
    
    private let toDownButton: CustomButton = {
        let button = CustomButton(image: UIImage(systemName: "arrowshape.down.fill"), color: .systemMint)

        return button
    }()
    
    private func setUP() {
        
        toLeftButton.addTarget(self, action: #selector(moveToLeft), for: .touchUpInside)
        toRightButton.addTarget(self, action: #selector(moveToRight), for: .touchUpInside)
        toUpButton.addTarget(self, action: #selector(moveToUp), for: .touchUpInside)
        toDownButton.addTarget(self, action: #selector(moveToDown), for: .touchUpInside)

        [toLeftButton, toRightButton, toUpButton, toDownButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
       
            toUpButton.widthAnchor.constraint(equalToConstant: 60),
            toUpButton.heightAnchor.constraint(equalToConstant: 60),
            toUpButton.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -40),
            toUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            toDownButton.widthAnchor.constraint(equalToConstant: 60),
            toDownButton.heightAnchor.constraint(equalToConstant: 60),
            toDownButton.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 40),
            toDownButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            toLeftButton.widthAnchor.constraint(equalToConstant: 60),
            toLeftButton.heightAnchor.constraint(equalToConstant: 60),
            toLeftButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -60),
            toLeftButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            toRightButton.widthAnchor.constraint(equalToConstant: 60),
            toRightButton.heightAnchor.constraint(equalToConstant: 60),
            toRightButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60),
            toRightButton.centerYAnchor.constraint(equalTo: centerYAnchor),

   
        ])
    }
    
    @objc private func moveToLeft(){
     onMoveLeft?()
    }
    
    @objc private func moveToRight(){
        onMoveRight?()
    }
    
    @objc private func moveToUp(){
        onMoveUp?()

    }
    
    @objc private func moveToDown(){
        onMoveDown?()
    }
    
}
