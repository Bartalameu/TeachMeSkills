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
    
    private let toLeftButton: CustomButton = {
        let button = CustomButton(image: UIImage(named: "leftButton"))

        return button
    }()
    
    private let toRightButton: CustomButton = {
        let button = CustomButton(image: UIImage(named: "rightButton"))

        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .none
        setUP()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setUP() {
        
        toLeftButton.addTarget(self, action: #selector(moveToLeft), for: .touchUpInside)
        toRightButton.addTarget(self, action: #selector(moveToRight), for: .touchUpInside)

        [toLeftButton, toRightButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
    
            toLeftButton.widthAnchor.constraint(equalToConstant: 80),
            toLeftButton.heightAnchor.constraint(equalToConstant: 80),
            toLeftButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
            toLeftButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),

            toRightButton.widthAnchor.constraint(equalToConstant: 80),
            toRightButton.heightAnchor.constraint(equalToConstant: 80),
            toRightButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
            toRightButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),

        ])
    }
    
    @objc private func moveToLeft(){
     onMoveLeft?()
    }
    
    @objc private func moveToRight(){
        onMoveRight?()
    }
 
    
}
