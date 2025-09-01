//
//  AlertView.swift
//  lesson_15(Alert Notiification - custom UIView)
//
//  Created by Vadzim Pappkou on 19.08.2025.
//

import UIKit

class AlertView: UIView {

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(ignoreButton)
        stack.addArrangedSubview(gotItButton)
        addSubview(stack)
        
        return stack
    }()
    
    lazy var offerLabel : UILabel = {
        let label = UILabel ()
        label.text = "Offer"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.text = """
                A set of 130 elements, perfectly fitting each
                other. Click, drag, ressize, adapt, combine.
                A set of 130 elements, perfectly fitting each
                """
        description.textColor  = .systemGray
        description.numberOfLines = 0
        description.textAlignment = .center
        description.translatesAutoresizingMaskIntoConstraints = false
        addSubview(description)
        
        return description
    }()
    
    lazy var ignoreButton: UIButton = {
        let button = UIButton ()
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.setTitle("IGNORE", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ignoreAction), for: .touchUpInside)
        
        return button
    }()
    
    lazy var gotItButton: UIButton = {
        let button = UIButton ()
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.setTitle("GOT IT", for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(gotItAction), for: .touchUpInside)

        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func configureUI() {
        
       backgroundColor = .white
        

        NSLayoutConstraint.activate([
            
            offerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            offerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: offerLabel.bottomAnchor,constant: 48),
            descriptionLabel.centerXAnchor.constraint(equalTo: offerLabel.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 48)
            
        ])
        
    }
    
    @objc func ignoreAction(){
        isHidden = true
    }
    
    @objc func gotItAction(){
        isHidden = true
    }
    
    
}
#Preview("", traits: .defaultLayout, body: {
    AlertView()
})
