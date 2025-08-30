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
        let safeFrame = view.safeAreaLayoutGuide.layoutFrame
        
        let randomX = CGFloat.random(in: 0...(safeFrame.width - button.frame.width))
        let randomY = CGFloat.random(in: 0...(safeFrame.height - button.frame.height))

        UIView.animate(withDuration: 0.2, animations: {

            self.button.snp.remakeConstraints { make in
                make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(randomX)
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(randomY)
            }
            self.view.layoutIfNeeded()
        })
    }
    }




