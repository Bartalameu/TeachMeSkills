//
//  ViewController.swift
//  homework_11
//
//  Created by Vadzim Pappkou on 05.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        initMainScreen()
        
    }
    
    private func initMainScreen () {
        
        let contentView = UIView ()
        let equaleTextField = UILabel()
        let mathOperationTextField = UITextField ()
        mathOperationTextField.text = "123123 + 12313"
        mathOperationTextField.textColor = .lightGray
        mathOperationTextField.font = .systemFont(ofSize: 25)
        equaleTextField.text = "123123"
        equaleTextField.font = .systemFont(ofSize: 50)
        equaleTextField.textColor = .white
        let stackView = UIStackView ()
        stackView.axis = .vertical
        stackView.spacing = 16
        
        for item in [equaleTextField,mathOperationTextField,stackView, contentView] {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let acButon = CustomButton(title: "AC", color: UIColor.lightGray)
        let plusMinusButon = CustomButton(image: UIImage(systemName: "plus.slash.minus"), color: UIColor.lightGray)
        let procentButon = CustomButton(title: "%", color: UIColor.lightGray)
        let divideButon = CustomButton(image: UIImage(systemName: "divide"), color: UIColor.orange)
        let sevenButon = CustomButton(title: "7", color: UIColor.darkGray)
        let eihgtButon = CustomButton(title: "8", color: UIColor.darkGray)
        let nineButon = CustomButton(title: "9", color: UIColor.darkGray)
        let multiplyButon = CustomButton(image: UIImage(systemName: "multiply"), color: UIColor.orange)
        let fourButon = CustomButton(title: "4", color: UIColor.darkGray)
        let fiveButon = CustomButton(title: "5", color: UIColor.darkGray)
        let sixButon = CustomButton(title: "6", color: UIColor.darkGray)
        let minusButon = CustomButton(title: "-", color: UIColor.orange)
        let oneButon = CustomButton(title: "1", color: UIColor.darkGray)
        let twoButon = CustomButton(title: "2", color: UIColor.darkGray)
        let threeButon = CustomButton(title: "3", color: UIColor.darkGray)
        let plusButon = CustomButton(title: "+", color: UIColor.orange)
        let calculButon = CustomButton(image: UIImage(named: "calculator")?.withRenderingMode(.alwaysTemplate), color: UIColor.darkGray)
        let zeroButon = CustomButton(title: "0", color: UIColor.darkGray)
        let pointButon = CustomButton(title: ".", color: UIColor.darkGray)
        let equelButon = CustomButton(title: "=", color: UIColor.orange)
        
        let row1 = UIStackView(arrangedSubviews: [acButon, plusMinusButon, procentButon, divideButon])
        row1.axis = .horizontal
        row1.distribution = .fillEqually
        row1.spacing = 8
        
        let row2 = UIStackView(arrangedSubviews: [sevenButon, eihgtButon, nineButon, multiplyButon])
        row2.axis = .horizontal
        row2.distribution = .fillEqually
        row2.spacing = 8
        
        let row3 = UIStackView(arrangedSubviews: [fourButon, fiveButon, sixButon, minusButon])
        row3.axis = .horizontal
        row3.distribution = .fillEqually
        row3.spacing = 8
        
        let row4 = UIStackView(arrangedSubviews: [oneButon, twoButon, threeButon, plusButon])
        row4.axis = .horizontal
        row4.distribution = .fillEqually
        row4.spacing = 8
        
        let row5 = UIStackView(arrangedSubviews: [calculButon, zeroButon, pointButon, equelButon])
        row5.axis = .horizontal
        row5.distribution = .fillEqually
        row5.spacing = 8
        
        stackView.addArrangedSubview(row1)
        stackView.addArrangedSubview(row2)
        stackView.addArrangedSubview(row3)
        stackView.addArrangedSubview(row4)
        stackView.addArrangedSubview(row5)
        
        NSLayoutConstraint.activate(
            [mathOperationTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                mathOperationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                equaleTextField.topAnchor.constraint(equalTo:mathOperationTextField.bottomAnchor,constant: -30),
                equaleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
                stackView.topAnchor.constraint(equalTo: equaleTextField.bottomAnchor, constant: 30),
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
                stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),])
        
    }
    
    
}

