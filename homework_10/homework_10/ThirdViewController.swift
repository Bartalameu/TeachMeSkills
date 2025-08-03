//
//  ViewController.swift
//  homework_10
//
//  Created by Vadzim Pappkou on 02.08.2025.
//

import UIKit

class ThirdViewController: UIViewController {
    var buttonNextVC : UIButton = UIButton ()
    var receviedLabel : UILabel = UILabel ()
    var pullText : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        
    }

    
    
    private func setUp () {
        
        receviedLabel.text = pullText
        view.backgroundColor = .white
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.title = "Push to send text to the next View"
        buttonConfig.baseBackgroundColor = .purple
        buttonConfig.cornerStyle  = .capsule
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        buttonNextVC.configuration = buttonConfig
        buttonNextVC.addTarget(self, action: #selector(pushedButton), for: .touchUpInside)
        receviedLabel.numberOfLines = 0
        receviedLabel.lineBreakMode = .byWordWrapping
        [buttonNextVC,receviedLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate( [buttonNextVC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                      buttonNextVC.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                      receviedLabel.topAnchor.constraint(equalTo: buttonNextVC.bottomAnchor, constant: 20),
                                      receviedLabel.leftAnchor.constraint(equalTo: buttonNextVC.leftAnchor),
                                      receviedLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)])
    }
    @objc private func pushedButton () {
        let fourVC = FourViewController ()
        fourVC.pullText = String("\(pullText) + \(String(describing: type(of: self)))")
        navigationController?.pushViewController(fourVC, animated: true)
    }
    
}

 
