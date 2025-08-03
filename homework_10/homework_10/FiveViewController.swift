//
//  ViewController.swift
//  homework_10
//
//  Created by Vadzim Pappkou on 02.08.2025.
//

import UIKit

class FiveViewController: UIViewController {
    var receviedLabel : UILabel = UILabel ()
    var pullText : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
    
    
    private func setUp () {
        
        receviedLabel.text = pullText
        view.backgroundColor = .white
        receviedLabel.numberOfLines = 0
        receviedLabel.lineBreakMode = .byWordWrapping
        [receviedLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([receviedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                      receviedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        receviedLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)])
    }
    
}


