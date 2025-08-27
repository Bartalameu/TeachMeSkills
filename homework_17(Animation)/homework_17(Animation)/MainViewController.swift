//
//  ViewController.swift
//  homework_17(Animation)
//
//  Created by Vadzim Pappkou on 26.08.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    private let gamingFieldView: UIView = UIView()
    
    private let boxView: UIView = {
       let ball = UIView()
        ball.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ball.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ball.backgroundColor = .systemOrange
        ball.translatesAutoresizingMaskIntoConstraints = false
        return ball
    }()

    private lazy var  buttonPanel = ButtonsPanelView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        buttonPanel.onMoveLeft = { [weak self] in
            guard let self = self else { return }
            if  (self.boxView.center.x) - 32 >= self.gamingFieldView.bounds.minX{
                UIView.animate(withDuration: 1) {
                    self.boxView.center.x -= 32
                }
            } else {
                print("RETURN")
                return
            }
        }

        buttonPanel.onMoveRight = { [weak self] in
            guard let self = self else { return }
            if self.boxView.center.x + 32 <= self.gamingFieldView.bounds.maxX{
                UIView.animate(withDuration: 1) {
                    self.boxView.center.x += 32
                }
            } else {
                return
            }
        }
        
        buttonPanel.onMoveUp = { [weak self] in
            guard let self = self else { return }
            if self.boxView.center.y + 32 <= self.gamingFieldView.bounds.maxY{
                UIView.animate(withDuration: 1) {
                    self.boxView.center.y += 32
                }
            } else {
                return
            }
            
        }
        
        buttonPanel.onMoveDown = { [weak self] in
            guard let self = self else { return }
            
            if self.boxView.center.y - 32 >= self.gamingFieldView.bounds.minY{
                UIView.animate(withDuration: 1) {
                    self.boxView.center.y -= 32
                }
            } else {
                return
            }
        }
    }
    
    private func configureUI(){
        
        
        gamingFieldView.backgroundColor = .systemGreen
        gamingFieldView.layer.cornerRadius = 32
        buttonPanel.layer.cornerRadius = 32

        [buttonPanel,gamingFieldView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
            }
        
        gamingFieldView.addSubview(boxView)
    
        NSLayoutConstraint.activate([
            buttonPanel.widthAnchor.constraint(equalToConstant: view.frame.width - 16),
            buttonPanel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPanel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            gamingFieldView.widthAnchor.constraint(equalToConstant: view.frame.width - 16),
            gamingFieldView.heightAnchor.constraint(equalToConstant: 600),

            gamingFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gamingFieldView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            gamingFieldView.bottomAnchor.constraint(equalTo: buttonPanel.topAnchor, constant: -8),
            
            boxView.centerXAnchor.constraint(equalTo: gamingFieldView.centerXAnchor),
            boxView.centerYAnchor.constraint(equalTo: gamingFieldView.centerYAnchor),
        ])
        
    }


}

