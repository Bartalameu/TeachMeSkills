//
//  ViewController.swift
//  homework_8
//
//  Created by Vadzim Pappkou on 26.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    let welcomeLabel : UILabel = UILabel ()
    var logInUserName : UITextField = UITextField ()
    var passwordField : UITextField = UITextField ()
    let textFieldUsername : UILabel = UILabel ()
    let textFieldPassword : UILabel = UILabel ()
    let buttonRegister : UIButton = UIButton ()
    let buttonLogIn : UIButton = UIButton ()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: "Background1")
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //welcomeLabel
        welcomeLabel.text = "My Home Control"
        welcomeLabel.textAlignment = .center
//        welcomeLabel.font = UIFont.systemFont(ofSize: 30, weight: .light)
        welcomeLabel.font = .systemFont(ofSize: 30)
        welcomeLabel.textColor = .white
//        welcomeLabel.frame = CGRect(x: 50, y: 100, width: 300, height: 60)
        view.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //logInUsername
        logInUserName.textAlignment = .left
        logInUserName.borderStyle = .roundedRect
        logInUserName.placeholder = "Please enter username "
        view.addSubview(logInUserName)
        logInUserName.translatesAutoresizingMaskIntoConstraints = false
        
        //textFieldUsername
        
        textFieldUsername.text = "Username"
        textFieldUsername.textColor = .white
        
        view.addSubview(textFieldUsername)
        textFieldUsername.translatesAutoresizingMaskIntoConstraints = false
        
        //passwordfield
        passwordField.textAlignment = .left
        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Please enter password "
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        //textFieldPassword
        textFieldPassword.text = "Password"
        textFieldPassword.textColor = .white
        view.addSubview(textFieldPassword)
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        
        //ButtonRegister
        buttonRegister.setTitle("Register", for: .normal)
        view.addSubview(buttonRegister)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        
        //buttonLogIn
        buttonLogIn.setTitle("Log In", for: .normal)
        buttonLogIn.backgroundColor = .gray
        buttonLogIn.layer.cornerRadius = 10
        view.addSubview(buttonLogIn)
        buttonLogIn.translatesAutoresizingMaskIntoConstraints = false
        
        
        [buttonRegister,buttonLogIn,textFieldPassword,passwordField,textFieldUsername,logInUserName,welcomeLabel].forEach { view.addSubview($0);             $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: view.topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     
                                     welcomeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), welcomeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100 ),
                                     logInUserName.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 110), logInUserName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     logInUserName.widthAnchor.constraint(equalToConstant: 300),
                                     logInUserName.heightAnchor.constraint(equalToConstant: 40), textFieldUsername.leftAnchor.constraint(equalTo: logInUserName.leftAnchor),textFieldUsername.bottomAnchor.constraint(equalTo: logInUserName.topAnchor, constant: -10),passwordField.topAnchor.constraint(equalTo: logInUserName.bottomAnchor,constant: 130),passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     passwordField.widthAnchor.constraint(equalToConstant: 300),
                                     passwordField.heightAnchor.constraint(equalToConstant: 40), textFieldPassword.leftAnchor.constraint(equalTo: passwordField.leftAnchor),textFieldPassword.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -10),buttonRegister.centerXAnchor.constraint(equalTo: view.centerXAnchor), buttonRegister.topAnchor.constraint(equalTo: buttonLogIn.bottomAnchor,constant: 200),buttonRegister.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20), buttonLogIn.centerXAnchor.constraint(equalTo: view.centerXAnchor), buttonLogIn.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 50),buttonLogIn.widthAnchor.constraint(equalToConstant: 200),buttonLogIn.heightAnchor.constraint(equalToConstant: 50)])
        


    }
    
    
    

   

   	
}



				
