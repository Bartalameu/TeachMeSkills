//
//  ViewController.swift
//  homework_18(Notification)
//
//  Created by Vadzim Pappkou on 30.08.2025.
//

import UIKit

class ViewController: UIViewController {
    private var textViewBottomConstraint: NSLayoutConstraint!
    private let textViewBottom: CGFloat = -150
    private var buttonSetBottomConstraint: NSLayoutConstraint!
    private let buttonSetBottom: CGFloat = -20

   private lazy var scrollView : UIScrollView = {
        var scroll = UIScrollView()
        scroll.addSubview(textLabel)
        scroll.layer.borderWidth = 1.0
        scroll.layer.borderColor = UIColor.lightGray.cgColor
        scroll.layer.cornerRadius = 8.0
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()
    
    private lazy var textView : UITextView = {
        var textField = UITextView()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.keyboardType = .default
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 8.0
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        return textField
    }()
    
    private lazy var textLabel : UILabel = {
        var  label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "HELLO THERE !"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        return label
    }()
    
    
    private lazy var buttonSet : UIButton = {
        var button = UIButton()
        button.setTitle("Push to Label", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 16
        button.addAction(UIAction {
            _ in
            self.textLabel.text  =  self.textView.text
            self.textView.text = ""
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationUI()
        subscriptionNotifications()
        addAction()
    }
    
    private func subscriptionNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow (_ notification: Notification) {
        
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        UIView.animate(withDuration: 0.3) {
            self.buttonSetBottomConstraint.constant = -(keyboardHeight - 20)
            self.textViewBottomConstraint.constant = -(keyboardHeight + 40)
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide (_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.buttonSetBottomConstraint.constant = self.buttonSetBottom
            self.textViewBottomConstraint.constant = self.textViewBottom
            self.view.layoutIfNeeded()
        }
    }
    
    private func addAction () {
        let tapGeasture = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGeasture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGeasture)
    }
    
    @objc private func tap(){
        view.endEditing(true)
    }
    
    private func configurationUI() {
        
        view.backgroundColor = .white
        view.addSubview(buttonSet)
        view.addSubview(scrollView)
        
        textViewBottomConstraint = textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: textViewBottom)
        textViewBottomConstraint.isActive = true
        
        buttonSetBottomConstraint = buttonSet.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: buttonSetBottom)
        buttonSetBottomConstraint.isActive = true

        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            scrollView.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -20),
            scrollView.heightAnchor.constraint(equalToConstant: 100),
            
            textLabel.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            textLabel.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 30),
            textLabel.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -30),
            textLabel.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -32),
            
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            
            buttonSet.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonSet.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonSet.heightAnchor.constraint(equalToConstant: 50)

            //   view.keyboardLayoutGuide.topAnchor IOS 15.0
//            buttonSet.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -40),
            
        ])
        
    }
    
}

// ДЗ:
//Написать приложение с одним экраном, на котором чуть ниже центра будет
//располагаться UITextField, ниже UITextField кнопка, а сверху UITextField - UILabel.
//При нажатии на кнопку, текст из UITextField будет отображаться в UILabel, UITextField
//при этом очищается.
//Обработать поднятие текстового поля при появлении клавиатуры, чтобы клавиатура
//не перекрывала текстовое поле.
//По нажатию на любое место на экране, скрывать клавиатуру.
// 
