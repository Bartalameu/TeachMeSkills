//
//  ThirdViewController.swift
//  homework_8
//
//  Created by Vadzim Pappkou on 27.07.2025.
//

import UIKit

class SecondViewController: UIViewController {
    
    let welcomeLabel : UILabel = UILabel ()
    let lightLabel : UILabel = UILabel ()
    let doorLabel : UILabel = UILabel ()
    let acLabel : UILabel = UILabel ()
    let appartmentLabel : UILabel = UILabel ()
    
    let imageHouse : UIImageView = UIImageView ()
    let lightSegment : UISegmentedControl = UISegmentedControl ()
    let doorSegment : UISegmentedControl = UISegmentedControl ()
    let acSegment : UISegmentedControl = UISegmentedControl ()
    let sliderTemp : UISlider = UISlider ()
    let buttonAlarm : UIButton = UIButton ()

    let tempLabel = UILabel()


//    @objc func tempChanged(_ sender: UISlider) {
//          let value = Int(sender.value)
//        self.tempLabel.text = "\(value) °C"
//      }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = .init(named: "Background2")
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //imageHouse
        
        imageHouse.image = UIImage (named: "house")
    
            
        
        tempLabel.textColor = .white
        tempLabel.text = "27 °C "
        
        lightLabel.text = "Lights"
        lightLabel.textColor = .white
        
       
 
        doorLabel.text = "Door"
        doorLabel.textColor = .white
        
           
        acLabel.text = "A/C"
        acLabel.textColor = .white
        
       
        //welcomeLabel

        welcomeLabel.text = "Welcome, user1234"
        welcomeLabel.textAlignment = .left
        welcomeLabel.font = .systemFont(ofSize: 35)
        welcomeLabel.textColor = .white
      
        
        //appartmentLabel

        appartmentLabel.text = "Appartment control page"
        appartmentLabel.textAlignment = .left
        appartmentLabel.font = .systemFont(ofSize: 25)
        appartmentLabel.textColor = .white
        
        
        //        buttonAlarm
        
        buttonAlarm.setTitle("Alarm", for: .normal)
        buttonAlarm.backgroundColor = .white
        buttonAlarm.setTitleColor(.red, for: .normal)
       
        //segmentLight
        lightSegment.backgroundColor = .gray
        lightSegment.insertSegment(withTitle: "On", at: 0, animated: true)
        lightSegment.insertSegment(withTitle: "Off", at: 1, animated: true)
       
        
        //segmentDoor
        lightSegment.backgroundColor = .gray
        doorSegment.insertSegment(withTitle: "Lock", at: 0, animated: true)
        doorSegment.insertSegment(withTitle: "Unlock", at: 1, animated: true)
        
        
        //segmentAC
        acSegment.backgroundColor = .gray
        acSegment.insertSegment(withTitle: "Auto", at: 0, animated: true)
        acSegment.insertSegment(withTitle: "On", at: 1, animated: true)
        acSegment.insertSegment(withTitle: "Off", at: 2, animated: true)
      
        //sliderTemp
        sliderTemp.maximumValue = 100
        sliderTemp.minimumValue  = -100
        sliderTemp.value = 0
        sliderTemp.backgroundColor = .gray

        
        
        
        [lightLabel,lightSegment,doorLabel,doorSegment,acLabel,acSegment,welcomeLabel,appartmentLabel,sliderTemp,tempLabel,buttonAlarm,imageHouse].forEach { view.addSubview($0);             $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: view.topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30), welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), appartmentLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
                                     appartmentLabel.leftAnchor.constraint(equalTo: welcomeLabel.leftAnchor),
                                     imageHouse.leftAnchor.constraint(equalTo: appartmentLabel.leftAnchor),
                                     imageHouse.topAnchor.constraint(equalTo: appartmentLabel.bottomAnchor),
                                     imageHouse.widthAnchor.constraint(equalToConstant: 30),
                                     imageHouse.heightAnchor.constraint(equalToConstant: 30),
                                     lightLabel.topAnchor.constraint(equalTo: imageHouse.bottomAnchor, constant: 50),
                                     lightLabel.leftAnchor.constraint(equalTo: lightSegment.leftAnchor),
                                     lightSegment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                                     lightSegment.topAnchor.constraint(equalTo: lightLabel.bottomAnchor,constant: 10),
                                     doorLabel.topAnchor.constraint(equalTo: lightSegment.bottomAnchor, constant: 10),
                                     doorLabel.leftAnchor.constraint(equalTo: doorSegment.leftAnchor),
                                     doorSegment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                                     doorSegment.topAnchor.constraint(equalTo: doorLabel.bottomAnchor, constant: 10),
                                     acLabel.topAnchor.constraint(equalTo: doorSegment.bottomAnchor, constant: 10),
                                     acLabel.leftAnchor.constraint(equalTo: acSegment.leftAnchor),
                                     acSegment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                                     acSegment.topAnchor.constraint(equalTo: acLabel.bottomAnchor, constant: 10),
                                     tempLabel.topAnchor.constraint(equalTo: acSegment.bottomAnchor, constant: 10),
                                     tempLabel.leftAnchor.constraint(equalTo: sliderTemp.leftAnchor),
                                     sliderTemp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                                     sliderTemp.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 10),
                                     sliderTemp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     buttonAlarm.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                                     buttonAlarm.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                                     buttonAlarm.widthAnchor.constraint(equalToConstant: 70),
                                     buttonAlarm.heightAnchor.constraint(equalToConstant: 50)
                                     
                            
                                     
                                    
                                     
                                     
                                     ])
        
        
    }
    
    
    
}
