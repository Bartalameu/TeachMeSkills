//
//  ViewController.swift
//  lessons_12
//
//  Created by Vadzim Pappkou on 06.08.2025.
//

import UIKit


class ProfileViewController: UIViewController {
    let gradientView = UIView ()

    let stackView: UIStackView =  {
        let stackView = UIStackView ()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    } ()
    
    let userName: PaddingLabel = {
        let userName = PaddingLabel()
        userName.text = "Name of User"
        userName.textColor = .white
        userName.layer.borderColor = UIColor.black.cgColor
        userName.layer.backgroundColor = UIColor(red: 0.5, green: 0.25, blue: 0.4, alpha: 0.8).cgColor
        userName.layer.cornerRadius = 10
        userName.font = .systemFont(ofSize: 20)
        userName.numberOfLines = 0
        return userName
    } ()
    let email: PaddingLabel = {
        let email = PaddingLabel()
        email.text = "Email of User"
        email.textColor = .white
        email.layer.borderColor = UIColor.black.cgColor
        email.layer.backgroundColor = UIColor(red: 0.5, green: 0.25, blue: 0.4, alpha: 0.8).cgColor
        email.layer.cornerRadius = 10
        email.font = .systemFont(ofSize: 30)
        email.numberOfLines = 0
        return email
    } ()
    let phoneNumber: PaddingLabel = {
        let phoneNumber = PaddingLabel()
        phoneNumber.text = "Phone Number of User"
        phoneNumber.textColor = .white
        phoneNumber.layer.borderColor = UIColor.black.cgColor
        phoneNumber.layer.backgroundColor = UIColor(red: 0.5, green: 0.25, blue: 0.4, alpha: 0.8).cgColor
        phoneNumber.layer.cornerRadius = 10
        phoneNumber.font = .systemFont(ofSize: 38)
        phoneNumber.numberOfLines = 0
        return phoneNumber
    } ()
    let editButton: UIButton = {
        let editButton = UIButton ()
        editButton.setTitle("Edit profile", for: .normal)
        editButton.backgroundColor = UIColor(red: 0.25, green: 0.55, blue: 0.45, alpha: 1.0)
        editButton.layer.cornerRadius = 16
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        return editButton
    } ()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.90, alpha: 1.0)
        setupUI()
        
    }
    
   private  func saveData(text: String) {
//        infoLabel.text  = text
    }
    
    private func setupUI() {
        editButton.addTarget(self, action: #selector(buttonOnPressed), for: .touchUpInside)

        [stackView, editButton].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        [userName,email,phoneNumber].forEach{
            stackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            editButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            editButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func buttonOnPressed() {
        
        let nextVC = EditProfileViewConroller()
                nextVC.complition = {
                    value in
                    print("IN PROFILEVIEW CLOSER")
                    self.userName.text = value.nameOfUser
                    self.email.text = value.email
                    self.phoneNumber.text = value.phoneNumber
                    
            
        }
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
}



//Delegate
//class FirstViewController: UIViewController, SetupInfoDelegate{
//
//    let infoLabel = UILabel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//
//    func saveData(text: String) {
//        infoLabel.text  = text
//    }
//
//    private func setupUI() {
//        view.backgroundColor = .white
//
//        infoLabel.text = "Нет данных"
//        infoLabel.numberOfLines = 0
//        infoLabel.textAlignment = .center
//        infoLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(infoLabel)
//
//        let button = UIButton()
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 16
//        button.setTitle("next", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(button)
//
//        button.addTarget(self, action: #selector(buttonOnPressed), for: .touchUpInside)
//
//        NSLayoutConstraint.activate([
//            infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
//            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            infoLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
//
//            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
//            button.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//
//    @objc private func buttonOnPressed() {
//        let nextVC = SecondViewController()
//        nextVC.delegate = self
//        navigationController?.pushViewController(nextVC, animated: true)
//
//    }
//}
