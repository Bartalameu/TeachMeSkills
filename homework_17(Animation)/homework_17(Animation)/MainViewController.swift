//
//  ViewController.swift
//  homework_17(Animation)
//
//  Created by Vadzim Pappkou on 26.08.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    private let gamingFieldView: UIView = UIView()
    
    enum MoveDirection {
        case left, right, up, down
    }
    
    private let ballView: CustomButton = {
        let ball = CustomButton(color: .orange)
        ball.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ball.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ball.translatesAutoresizingMaskIntoConstraints = false
        ball.isEnabled = false
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
        buttonsCallBack()
    }
    
    private func moveBall (forX x: CGFloat? = nil, forY y: CGFloat? = nil, direction: MoveDirection ) {
        
        switch (x, y, direction) {
            
        case  (let x?, nil, .left) :
            UIView.animate(withDuration: 1) {
                let maxX = self.gamingFieldView.bounds.minX + self.ballView.bounds.width / 2
                let newX = max(self.ballView.center.x - x, maxX)
                self.ballView.center.x = newX
            }
            
        case (let x?, nil, .right):
            UIView.animate(withDuration: 1) {
                let maxX = self.gamingFieldView.bounds.maxX - self.ballView.bounds.width / 2
                let newX = min(self.ballView.center.x + x, maxX)
                self.ballView.center.x = newX
            }
            
        case (nil, let y?, .up):
            UIView.animate(withDuration: 1) {
            let maxY = self.gamingFieldView.bounds.minY + self.ballView.bounds.height / 2
            let newY = max(self.ballView.center.y - 50, maxY)
            self.ballView.center.y = newY
        }
            
        case (nil, let y?, .down):
            UIView.animate(withDuration: 1) {
                let maxY = self.gamingFieldView.bounds.maxY - self.ballView.bounds.height / 2
                let newY = min(self.ballView.center.y + 50, maxY)
                self.ballView.center.y = newY
            }
            
        default:
            print("X and Y nil")
        }
    }
    
    private func buttonsCallBack(){
        
        buttonPanel.onMoveLeft = { [weak self] in
            guard let self = self else { return }
            moveBall(forX: 50 , direction: .left)
        }
        
        buttonPanel.onMoveRight = { [weak self] in
            guard let self = self else { return }
            moveBall(forX: 50 , direction: .right)

        }
        
        buttonPanel.onMoveUp = { [weak self] in
            guard let self = self else { return }
            moveBall(forY: 50 , direction: .up)

        }
        
        buttonPanel.onMoveDown = { [weak self] in
            guard let self = self else { return }
            moveBall(forY: 50 , direction: .down)

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
        
        gamingFieldView.addSubview(ballView)
    
        NSLayoutConstraint.activate([
            buttonPanel.widthAnchor.constraint(equalToConstant: view.frame.width - 16),
            buttonPanel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPanel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            gamingFieldView.widthAnchor.constraint(equalToConstant: view.frame.width - 16),
            gamingFieldView.heightAnchor.constraint(equalToConstant: 600),

            gamingFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gamingFieldView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            gamingFieldView.bottomAnchor.constraint(equalTo: buttonPanel.topAnchor, constant: -8),
            
            ballView.centerXAnchor.constraint(equalTo: gamingFieldView.centerXAnchor),
            ballView.centerYAnchor.constraint(equalTo: gamingFieldView.centerYAnchor),
        ])
    }
}


//
//
//print("BoxView.layer.frame.minX =   \(self.boxView.layer.frame.minX)")
//print("BoxView.layer.frame.maxX =   \(self.boxView.layer.frame.maxX)")
//print("BoxView.layer.frame.maxY =   \(self.boxView.layer.frame.maxY)")
//print("BoxView.layer.frame.minY =   \(self.boxView.layer.frame.minY)")
//print("BoxView.layer.bounds.minX =   \(self.boxView.layer.bounds.minX)")
//print("BoxView.layer.bounds.maxX =   \(self.boxView.layer.bounds.maxX)")
//print("BoxView.layer.bounds.maxY =   \(self.boxView.layer.bounds.maxY)")
//print("BoxView.layer.bounds.minY =   \(self.boxView.layer.bounds.minY)")
//
//print("BoxView.center.X =   \(self.boxView.center.x)")
//print("BoxView.center.Y =   \(self.boxView.center.y)")
//
//print("GamingField.bounds.width =   \(self.gamingFieldView.bounds.width)")
//print("GamingField.frame.width =   \(self.gamingFieldView.frame.width)")
//print("GamingField.frame.height =   \(self.gamingFieldView.frame.height)")
//print("GamingField.bounds.height =   \(self.gamingFieldView.bounds.width)")
//print("GamingField.frame.maxX =   \(self.gamingFieldView.frame.maxX)")
//print("GamingField.frame.minX =   \(self.gamingFieldView.frame.minX)")
//print("GamingField.frame.maxY =   \(self.gamingFieldView.frame.maxY)")
//print("GamingField.frame.minY =   \(self.gamingFieldView.frame.minY)")
