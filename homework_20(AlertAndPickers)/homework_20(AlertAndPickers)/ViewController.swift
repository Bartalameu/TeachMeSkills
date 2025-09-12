//
//  ViewController.swift
//  homework_20(AlertAndPickers)
//
//  Created by Vadzim Pappkou on 11.09.2025.
//

import UIKit
import PhotosUI

class ViewController: UIViewController ,UIPickerViewDelegate,
                      UIPickerViewDataSource ,
                      PHPickerViewControllerDelegate,
                      UITableViewDelegate,
                      UITableViewDataSource




{
    
    private let scrollView = UIScrollView()
    private let tableView = UITableView()
    
    private var imagesFromGallery : [UIImage] = []
    
    private var systImages = [UIImage(systemName: "eraser"),
                              UIImage(systemName: "eraser"),
                              UIImage(systemName: "eraser"),
                              UIImage(systemName: "eraser"), ]
    
    private var cityLabel = {
        let label = UILabel()
        label.text = " Here your label"
        label.textAlignment = .center
        return label
    }()
    
    private var imageView = {
       
        let image = UIImageView()
        image.image = UIImage(systemName: "pencil")
        image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    
    private lazy  var alertButton = {
        let button = UIButton()
        button.setTitle("Show Alert", for: .normal)
        button.backgroundColor = .systemPink
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 16
        button.addAction(UIAction.init(handler: { _ in
            self.showAlert()
        }), for: .touchUpInside)
        return button
    }()
    
    private lazy var imageButton = {
        let button = UIButton()
        button.setTitle("Get Image", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 16
        button.addAction(UIAction.init(handler: { _ in
            self.showGallery()
        }), for: .touchUpInside)

        return button
    }()
    
    private let pickerView = UIPickerView()
    
    private let pickerData = ["Москва", "Нью-Йорк", "Лондон", "Париж"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()

  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }
    
    
    private func configureUI() {
        pickerView.delegate = self
        pickerView.dataSource = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 200
        tableView.register(ImageViewCell.self, forCellReuseIdentifier: "ImageViewCell")

        [alertButton, pickerView, imageButton, cityLabel, imageView, tableView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: cityLabel.topAnchor),

            cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cityLabel.bottomAnchor.constraint(equalTo: pickerView.topAnchor,constant: -16),

            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pickerView.bottomAnchor.constraint(equalTo: imageButton.topAnchor, constant: -30),
            
            imageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageButton.bottomAnchor.constraint(equalTo: alertButton.topAnchor, constant: -16),
                        
            alertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            alertButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -16),
            
        ])
    }
    
    private func  showAlert() {
        let alert = UIAlertController(title: "Attention!", message: "Payment declined!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityLabel.text = pickerData[row]
    }
    
    private func  showGallery() {
        
         var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 0
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true, completion: nil)

    }
    
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        for item in results {
            item.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
                if let image = reading as? UIImage {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.imagesFromGallery.append(image)
                    }
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)

    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesFromGallery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell", for: indexPath) as! ImageViewCell
        let currentImage = imagesFromGallery[indexPath.row]
        cell.mainImageView.image = currentImage
        return cell
        
    }
    
}




//Дз:
//
//
//
//1. Добавьте на главный экран (UIViewController) кнопку с надписью"Показать сообщение».
//• При нажатии на кнопку, открывайте UIAlertController с заголовком и текстом (например,
//"Важное сообщение" и "Спасибо, что выбрали наше приложение!»).
//• UIAlertController должен содержать две кнопки: "OK" и "Отмена". При нажатии на "OK",
//выведите на экран сообщение"Спасибо!". При нажатии на "Отмена", закройте
//UIAlertController.
//2. Добавьте на главный экран UIPickerView с компонентами для выбора города. Вы можете
//использовать список городов, например: "Москва", "Нью-Йорк", "Лондон", «Париж».
//• Добавьте UILabel для отображения выбранного города.
//• При выборе города в UIPickerView, отобразите выбранный город в UILabel.
//3. Добавьте на главный экран еще одну кнопку с надписью"Загрузить изображение».
//• При нажатии на кнопку, открывайте UIImagePickerController, который позволит
//пользователю выбрать изображение из фотоальбома устройства.
//• После выбора изображения, отображайте его на экране (например, в UIImageView).
