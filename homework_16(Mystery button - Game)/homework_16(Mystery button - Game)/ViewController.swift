//
//  ViewController.swift
//  homework_16(Mystery button - Game)
//
//  Created by Vadzim Pappkou on 21.08.2025.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let button =  CustomButton(title: "Tap On Me", color: .red)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.center.equalTo(view.center)
        }
        
        button.addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)

    }
    
    @objc func touchDown() {
        button.backgroundColor = .systemRed
         }

    @objc func touchUp() {
        button.backgroundColor = .red
        let maxOffsetX = CGFloat.random(in: 0...(view.frame.width - button.frame.width))
        let maxOffsetY = CGFloat.random(in: 0...(view.frame.height - button.frame.height))

        UIView.animate(withDuration: 0.2, animations: {

            self.button.snp.remakeConstraints { make in
                make.leading.equalToSuperview().offset(maxOffsetX)
                make.top.equalToSuperview().offset(maxOffsetY)
            }
            self.view.layoutIfNeeded()
        })
    }
    }




