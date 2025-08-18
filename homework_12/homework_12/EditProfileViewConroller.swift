//
//  ViewController.swift
//  lessons_12
//
//  Created by Vadzim Pappkou on 06.08.2025.
//

import UIKit

class EditProfileViewConroller: UIViewController, UITextFieldDelegate {
    
    var complition : ((ProfileData) -> ())?
    
    let infoStackView: UIStackView = {
        let infoStackView = UIStackView ()
        infoStackView.axis = .vertical
        infoStackView.spacing = 50
        infoStackView.alignment = .fill
        return infoStackView
    }()
    
    let nameTextField: UITextFieldPadding = {
        let name = UITextFieldPadding ()
        name.placeholder = "Name Of User"
        name.layer.borderColor = UIColor(red: 0.5, green: 0.25, blue: 0.4, alpha: 0.8).cgColor
        name.layer.borderWidth = 2
        name.layer.cornerRadius = 10
        name.font = UIFont.systemFont(ofSize: 30)
        return name
    }()
    
    let emailTextField: UITextFieldPadding = {
        let email = UITextFieldPadding ()
        email.placeholder = "Email of User"
        email.layer.borderColor = UIColor(red: 0.5, green: 0.25, blue: 0.4, alpha: 0.8).cgColor
        email.layer.borderWidth = 2
        email.layer.cornerRadius = 10
        email.font = UIFont.systemFont(ofSize: 30)
        return email
    }()
    
    let phoneNumber: UITextFieldPadding = {
        let phone = UITextFieldPadding ()
        phone.placeholder = "Phone Number of User"
        phone.layer.cornerRadius = 10
        phone.layer.borderColor = UIColor(red: 0.5, green: 0.25, blue: 0.4, alpha: 0.8).cgColor
        phone.layer.borderWidth = 2
        phone.font = UIFont.systemFont(ofSize: 30)
        
        return phone
        
    }()
    
    let saveButton: UIButton = {
        let button = UIButton ()
        button.backgroundColor = UIColor(red: 0.25, green: 0.55, blue: 0.45, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.setTitle("Save Profile", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        return button
    } ()
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        setupUI()
    }
    
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//  
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        let name: String
//        if let someName = nameTextField.text , someName.contains(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,50}$/) {
//            name = someName
//        } else {
//            textField.text = "" 
//            textField.attributedPlaceholder = NSAttributedString(
//                string: "Enter your name",
//                attributes: [
//                    .foregroundColor: UIColor.red,
//                    .font: UIFont.italicSystemFont(ofSize: 16)
//                ]
//            )
//        }
//    }
    private func setupUI() {
        
        saveButton.addTarget(self, action: #selector(saveOnTapped), for: .touchUpInside)
        [infoStackView, saveButton].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        [nameTextField, emailTextField, phoneNumber].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            infoStackView.addArrangedSubview($0)
            $0.delegate = self
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
    
    @objc private func saveOnTapped() {
//        complition?("Имя пользователя: \(userName.text), год рождения \(email.text), город \(phoneNumber.text) ")
//        delegate?.saveData(text: "Имя пользователя: \(nameTextField.text), год рождения \(yearTextField.text), город \(cityTextField.text) " )
        
        let name: String
        let email: String
        let phone: String
        if let someName = nameTextField.text , someName.contains(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,50}$/) {
            name = someName
        } else {
            //            print("""
            //
            //                  Wrong typed User name, should be
            //                  Minimum 8 characters
            //                  Maximum 50 characters
            //                  Minimum 1 alphabet
            //                  Minimum 1 number
            //                  No special characters
            // """)
            nameTextField.attributedPlaceholder = NSAttributedString(
                string: "8–50 chars, at least 1 letter & 1 number, no symbols",
                attributes: [
                    .foregroundColor: UIColor.red,
                    .font: UIFont.italicSystemFont(ofSize: 16)
                ])
            return
        }
        
        if let someEmail = emailTextField.text, someEmail.contains( /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/) {
            email = someEmail
        } else {
            emailTextField.attributedPlaceholder = NSAttributedString(
                string: "Wrong email, format should be somename@domain.com",
                attributes: [
                    .foregroundColor: UIColor.red,
                    .font: UIFont.italicSystemFont(ofSize: 16)
                ])
            return
        }
        if let somePhone = phoneNumber.text, somePhone.contains(/^\+375\s(25|29|33|44)\s\d{3}\s\d{2}\s\d{2}$/) {
            phone = somePhone        }
        else {
            emailTextField.attributedPlaceholder = NSAttributedString(
                string: "should be +375 code XXX XX XX , where code: 25, 29, 33 or 44",
                attributes: [
                    .foregroundColor: UIColor.red,
                    .font: UIFont.italicSystemFont(ofSize: 16)
                ])
            return
        }
        let profileData = ProfileData (nameOfUser: name, email: email, phoneNumber: phone)
        complition?(profileData)
        navigationController?.popViewController(animated: true)
    }
}







