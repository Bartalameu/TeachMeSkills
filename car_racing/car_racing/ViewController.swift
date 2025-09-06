//
//  ViewController.swift
//  car_racing
//
//  Created by Vadzim Pappkou on 04.09.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?

    enum MoveDirection {
        case left, right
    }
    
    let cars: [CarView] = [CarView(imageView: UIImageView(image: UIImage(named: "Audi") )),
                           CarView(imageView: UIImageView(image: UIImage(named: "Black_viper") )),
                           CarView(imageView: UIImageView(image: UIImage(named: "Car") )),
                           CarView(imageView: UIImageView(image: UIImage(named: "Mini_truck") )),
                           CarView(imageView: UIImageView(image: UIImage(named: "Mini_van") )),
                           CarView(imageView: UIImageView(image: UIImage(named: "Ambulance") )),
                           CarView(imageView: UIImageView(image: UIImage(named: "taxi") ))]
    
    
    private lazy var  buttonPanel = ButtonsPanelView()
    
    private let mainCarView: CarView = {
        let car = CarView(imageView: UIImageView(image: UIImage(named: "redCar") ))
        return car
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addRandomCar()
        buttonsCallBack()

        Task {
            startTimer()
        }
        
        }
    
 
    private func startTimer() {
        
            self.timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(racingCar(_:)), userInfo: nil, repeats:true)

    }
    
    
    @objc private func racingCar(_ timer: Timer) {
        
        
        let random = Int.random(in: 0...self.cars.count-1)
        let audi = self.cars[random]
        
        let oldY = audi.center.y
        
        UIView.animate(withDuration: 3.5, animations: {
            audi.center.y += self.view.frame.maxY + 50
        
        }, completion: { _ in
            audi.center.y = oldY
        })
        
    }
              
        
    
    
    private func moveCar (forX x: CGFloat? = nil,  direction: MoveDirection ) {
        
        switch (x, direction) {
            
        case  (let x?, .left) :
            
            let maxX = self.view.bounds.minX + self.mainCarView.bounds.width / 3
            let newX = max(self.mainCarView.center.x - x, maxX)
            
            UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
                        self.mainCarView.center.x = newX
                    }.startAnimation()


        case (let x?, .right):
            let maxX = self.view.bounds.maxX  - self.mainCarView.bounds.width / 3
            let newX = min(self.mainCarView.center.x + x, maxX)
            UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
                      self.mainCarView.center.x = newX
                  }.startAnimation()

        default:
            print("X and Y nil")
        }
    }
    
    private func buttonsCallBack(){
        
        buttonPanel.onMoveLeft = { [weak self] in
            guard let self = self else { return }
            moveCar(forX: 50 , direction: .left)
        }
        
        buttonPanel.onMoveRight = { [weak self] in
            guard let self = self else { return }
            moveCar(forX: 50 , direction: .right)

        }
        
    }
    
    private func addRandomCar(){
        
        for car in cars {
            let randomX = CGFloat.random(in: 0...(view.bounds.width - 100))
            let randomY = -10.0
            car.frame = CGRect(x: randomX,
                              y: randomY,
                              width: 150,
                              height: 150)
            view.addSubview(car)
        }
        

        
    }
        
    private  func configureUI(){

        let backgroundImage = UIImage(named: "road")
        let backgroundImageView = UIImageView(frame: self.view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        self.view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
        
     
        
        [buttonPanel, mainCarView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        
    
     
        NSLayoutConstraint.activate([
            buttonPanel.widthAnchor.constraint(equalToConstant: view.frame.width ),
            buttonPanel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttonPanel.heightAnchor.constraint(equalToConstant: 100),
            
            mainCarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainCarView.bottomAnchor.constraint(equalTo: buttonPanel.topAnchor, constant: -16),
            mainCarView.widthAnchor.constraint(equalToConstant: 150),
            mainCarView.heightAnchor.constraint(equalToConstant: 150)
            
            
        ])
    }
    
}
