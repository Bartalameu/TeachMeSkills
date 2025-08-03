//  ViewController.swift
//  homework_10
//
//  Created by Vadzim Pappkou on 02.08.2025.
//

import UIKit

class SecondViewController: UIViewController {
    
   var buttonNextVC : UIButton = UIButton ()
    var receviedLabel : UILabel = UILabel ()
    var pullText : String = ""
    var person : Person?
    var labelPerson : UILabel = UILabel ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }


    private func setUp () {
        receviedLabel.text = pullText
        if let man = person{
            labelPerson.text = String("Name: \(man.name) \nocupation: \(man.occupation) \ngender: \(man.gender) \nage: \(man.age) ")
        }
        view.backgroundColor = .white
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.title = "Push to send text to the next View"
        buttonConfig.baseBackgroundColor = .black
        buttonConfig.cornerStyle  = .capsule
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        buttonNextVC.configuration = buttonConfig
        buttonNextVC.addTarget(self, action: #selector(pushedButton), for: .touchUpInside)
        receviedLabel.numberOfLines = 0
        receviedLabel.lineBreakMode = .byWordWrapping
        labelPerson.numberOfLines = 0
        labelPerson.lineBreakMode = .byWordWrapping
        [buttonNextVC,receviedLabel,labelPerson].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
      
        
        NSLayoutConstraint.activate( [buttonNextVC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                      buttonNextVC.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                      receviedLabel.topAnchor.constraint(equalTo: buttonNextVC.bottomAnchor, constant: 20),
                                      receviedLabel.leftAnchor.constraint(equalTo: buttonNextVC.leftAnchor),
                                      receviedLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
                                      labelPerson.topAnchor.constraint(equalTo: receviedLabel.bottomAnchor, constant: 20),
                                      labelPerson.leftAnchor.constraint(equalTo: receviedLabel.leftAnchor),
                                      labelPerson.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
                                     ])
    }
    @objc private func pushedButton () {
        let thirdVC = ThirdViewController ()
        thirdVC.pullText = String("\(pullText) + \(String(describing: type(of: self)))")
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
}

 
