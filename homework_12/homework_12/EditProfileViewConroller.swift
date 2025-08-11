//
//  ViewController.swift
//  lessons_12
//
//  Created by Vadzim Pappkou on 06.08.2025.
//

import UIKit

class EditProfileViewConroller: UIViewController {
    
    var complition : ((ProfileData) -> ())?
    
    let infoStackView: UIStackView = {
        let infoStackView = UIStackView ()
        infoStackView.axis = .vertical
        infoStackView.spacing = 50
        infoStackView.alignment = .fill
        return infoStackView
    }()
    
    let userName: UITextFieldPadding = {
        let nameTextField = UITextFieldPadding ()
        nameTextField.placeholder = "Name Of User"
        nameTextField.layer.borderColor = UIColor(red: 0.5, green: 0.25, blue: 0.4, alpha: 0.8).cgColor
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.cornerRadius = 10
        nameTextField.font = UIFont.systemFont(ofSize: 30)
        return nameTextField
    }()
    
    let emailOfUser: UITextFieldPadding = {
        let email = UITextFieldPadding ()
        email.placeholder = "Email of User"
        email.layer.borderColor = UIColor(red: 0.5, green: 0.25, blue: 0.4, alpha: 0.8).cgColor
        email.layer.borderWidth = 2
        email.layer.cornerRadius = 10
        email.font = UIFont.systemFont(ofSize: 30)
        return email
    }()
    
    let phoneNumber: UITextFieldPadding = {
        let phoneNumber = UITextFieldPadding ()
        phoneNumber.placeholder = "Phone Number of User"
        phoneNumber.layer.cornerRadius = 10
        phoneNumber.layer.borderColor = UIColor(red: 0.5, green: 0.25, blue: 0.4, alpha: 0.8).cgColor
        phoneNumber.layer.borderWidth = 2
        phoneNumber.font = UIFont.systemFont(ofSize: 30)
        return phoneNumber
        
    }()
    
    let saveButton: UIButton = {
        let saveButton = UIButton ()
        saveButton.backgroundColor = UIColor(red: 0.25, green: 0.55, blue: 0.45, alpha: 1.0)
        saveButton.layer.cornerRadius = 20
        saveButton.setTitle("Save Profile", for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        return saveButton
    } ()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        setupUI()
    }
    
    private func setupUI() {
        saveButton.addTarget(self, action: #selector(saveOnTapped), for: .touchUpInside)
        [infoStackView, saveButton].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        [userName, emailOfUser, phoneNumber].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            infoStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func saveOnTapped() {
//        complition?("Имя пользователя: \(userName.text), год рождения \(email.text), город \(phoneNumber.text) ")
//        delegate?.saveData(text: "Имя пользователя: \(nameTextField.text), год рождения \(yearTextField.text), город \(cityTextField.text) " )
        
        let name: String
        let email: String
        let phone: String
        
        if let someName = userName.text , someName.contains(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,50}$/) {
            name = someName
        } else {
            print("""
                  Wrong typed User name, should be
                  Minimum 8 characters
                  Maximum 50 characters
                  Minimum 1 alphabet
                  Minimum 1 number
                  No special characters
 """)
            return
        }
        
        if let someEmail = emailOfUser.text, someEmail.contains( /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/) {
            email = someEmail
        } else {
            print("Wrong email, format should be somename@domain.com ")
            return
        }
        if let somePhone = phoneNumber.text, somePhone.contains(/^\+375\s(25|29|33|44)\s\d{3}\s\d{2}\s\d{2}$/) {
            phone = somePhone        }
        else {
            print ("Wrong phone number formaе, should be +375 code XXX XX XX , where code: 25, 29, 33 or 44")
            return
        }
        let profileData = ProfileData (nameOfUser: name, email: email, phoneNumber: phone)
        complition?(profileData)
        navigationController?.popViewController(animated: true)
    }
}







