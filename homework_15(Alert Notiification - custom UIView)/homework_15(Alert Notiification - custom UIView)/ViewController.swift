//
//  ViewController.swift
//  lesson_15(Alert Notiification - custom UIView)
//
//  Created by Vadzim Pappkou on 19.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var showAlertButton: UIButton = {
        let button = UIButton ()
        button.setTitle("Show Alert", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.addTarget(self, action: #selector(showAllertView), for: .touchUpInside)
        return button
    }()
    
    lazy var alertView: AlertView = {
       let alert = AlertView ()
        alert.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alert)
        alert.isHidden = true
        
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

        NSLayoutConstraint.activate([
            alertView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            alertView.widthAnchor.constraint(equalToConstant: 300),
            alertView.heightAnchor.constraint(equalToConstant: 300),
            
            
            showAlertButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -32),
            showAlertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            showAlertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            showAlertButton.widthAnchor.constraint(equalToConstant: 50),
            showAlertButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            
            
        ])


    }

    @objc private func showAllertView(){
        alertView.isHidden = false
        
    }

}


#Preview("", traits: .defaultLayout, body: {
    AlertView()
})
