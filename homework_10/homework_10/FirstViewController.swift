//
//  ViewController.swift
//  homework_10
//
//  Created by Vadzim Pappkou on 02.08.2025.
//

import UIKit

class FirstViewController: UIViewController {
    var buttonNextVC : UIButton = UIButton ()
    var textToSend : UILabel = UILabel ()
    var messege : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    
    private func  setUp () {
        
        view.backgroundColor = .white
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.title = "Push to send text to the next View"
        buttonConfig.baseBackgroundColor = .red
        buttonConfig.cornerStyle  = .capsule
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        buttonNextVC.configuration = buttonConfig
        buttonNextVC.addTarget(self, action: #selector(pushedButton), for: .touchUpInside)
        textToSend.numberOfLines = 0
        textToSend.lineBreakMode = .byWordWrapping
        textToSend.text =  "This text is going to be pushed"
        messege = textToSend.text ?? "Error he text field was empty"
        [buttonNextVC,textToSend].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate( [buttonNextVC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                      buttonNextVC.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                      textToSend.topAnchor.constraint(equalTo: buttonNextVC.bottomAnchor, constant: 20),
                                      textToSend.leftAnchor.constraint(equalTo: buttonNextVC.leftAnchor),
                                      textToSend.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)])
        
    }
    
    @objc private func pushedButton () {
        let person  = Person(name: "ALik", gender: "Male", age: 18, occupation: "Student")
        let secondVC = SecondViewController ()
        secondVC.person = person
        secondVC.pullText = String("\(messege) + \(String(describing: type(of: self)))")
        navigationController?.pushViewController(secondVC , animated: true)
        
        
    }
}
    
    


