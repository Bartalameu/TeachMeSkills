//
//  ViewController2.swift
//  homework_8
//
//  Created by Vadzim Pappkou on 26.07.2025.
//

import UIKit

class ThirdViewController: UIViewController {
    
   
    
    let welcomeLabel : UILabel = UILabel ()
    var logInField : UITextField = UITextField ()
    var passwordField : UITextField = UITextField ()
    var confirmPassField : UITextField = UITextField ()
    let labelUsername : UILabel = UILabel ()
    let labelPassword : UILabel = UILabel ()
    let labelConfirmPassw : UILabel = UILabel ()
    let buttonSave : UIButton = UIButton ()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = .init(named: "Background3")
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //welcomeLabel
        welcomeLabel.text = "Registration Form"
        welcomeLabel.textAlignment = .left
        welcomeLabel.font = .systemFont(ofSize: 30)
        welcomeLabel.textColor = .white
        
        //logInUsername
        logInField.textAlignment = .left
        logInField.borderStyle = .roundedRect
        logInField.placeholder = "Please enter username "
     
        
        //textFieldUsername
        
        labelUsername.text = "Username"
        labelUsername.textColor = .white
        

        //passwordfield
        passwordField.textAlignment = .left
        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Please enter password "
     
        
        
//        confirmPassField
        
        confirmPassField.textAlignment = .left
        confirmPassField.borderStyle = .roundedRect
        confirmPassField.placeholder = "Please confirm password "
        
        
        
//        labelConfirPassw
        labelConfirmPassw.text = "Confirm password"
        labelConfirmPassw.textColor = .white
        
        
        //textFieldPassword
        labelPassword.text = "Password"
        labelPassword.textColor = .white
  
 
        
        //buttonSave
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.backgroundColor = .gray
        buttonSave.layer.cornerRadius = 10
    
        
        
        [buttonSave,labelPassword,labelConfirmPassw,confirmPassField,passwordField,labelUsername, logInField,welcomeLabel].forEach { view.addSubview($0);             $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: view.topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     
                                     welcomeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10 ),
                                     welcomeLabel.bottomAnchor.constraint(equalTo: logInField.topAnchor, constant: 15),
                                     logInField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     logInField.widthAnchor.constraint(equalToConstant: 300),
                                     logInField.heightAnchor.constraint(equalToConstant: 40), labelUsername.leftAnchor.constraint(equalTo: logInField.leftAnchor),
                                     labelUsername.bottomAnchor.constraint(equalTo: logInField.topAnchor, constant:-10),
                                     passwordField.topAnchor.constraint(equalTo: logInField.bottomAnchor,
                                                                        constant: 50),
                                     passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     passwordField.widthAnchor.constraint(equalToConstant: 300),
                                     confirmPassField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     confirmPassField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 50), confirmPassField.widthAnchor.constraint(equalToConstant: 300),
                                     confirmPassField.heightAnchor.constraint(equalToConstant: 40),
                                     labelConfirmPassw.bottomAnchor.constraint(equalTo: confirmPassField.topAnchor,constant: -10),
                                     labelConfirmPassw.leftAnchor.constraint(equalTo: confirmPassField.leftAnchor),
                                     passwordField.widthAnchor.constraint(equalToConstant: 300),
                                     passwordField.heightAnchor.constraint(equalToConstant: 40),
                                     labelPassword.leftAnchor.constraint(equalTo: passwordField.leftAnchor),
                                     labelPassword.bottomAnchor.constraint(equalTo: passwordField.topAnchor,constant: -10),
                                     buttonSave.centerXAnchor.constraint(equalTo: view.centerXAnchor), buttonSave.topAnchor.constraint(equalTo: confirmPassField.bottomAnchor, constant: 100), buttonSave.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40), buttonSave.widthAnchor.constraint(equalToConstant: 120),
                                     buttonSave.heightAnchor.constraint(equalToConstant: 50),
                                     buttonSave.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
                                    ])
        
        
        
    }
    
    
    

   

       
}
