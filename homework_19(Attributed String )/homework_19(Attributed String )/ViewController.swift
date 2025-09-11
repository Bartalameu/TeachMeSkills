//
//  ViewController.swift
//  homework_19(Attributed String )
//
//  Created by Vadzim Pappkou on 09.09.2025.
//

import UIKit

class ViewController: UIViewController {
    
    /// enum для именования  сегментов в  UISegmentedControl
    enum TypeOfAddition: String {
        case color = "color"
        case font = "font"
        case underline = "underline"
        case hyperlink = "hyperlink"
        case image = "image"
    }
    
    private var newText: NSMutableAttributedString?
    private var oldText: NSAttributedString?
    
    ///тестовый текст, TypeOfAddition добавлено для поиска по ключу в String
    private  let testingText: [TypeOfAddition: String] = [TypeOfAddition.color: "This some different color.",
                                                          TypeOfAddition.font: "There some new font.",
                                                          TypeOfAddition.underline: "and this some underline text.",
                                                          TypeOfAddition.hyperlink: "https://stackoverflow.com/",
                                                          TypeOfAddition.image: "The good one image:"]
    ///массив с raw значениями для именования сегментов в UISegmentedControl
    private let nameOfSections: [TypeOfAddition] = [
        TypeOfAddition.color, TypeOfAddition.font, TypeOfAddition.underline, TypeOfAddition.hyperlink, TypeOfAddition.image]
    
    private let fontSize: CGFloat = 25.0
    
    lazy var textViewField: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: fontSize)
        textView.backgroundColor = .systemGray5
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.cornerRadius = 16.0
        textView.text = """
                        \(testingText[TypeOfAddition.color] ?? "") 
                        \(testingText[TypeOfAddition.font] ?? "") 
                        \(testingText[TypeOfAddition.underline] ?? "") 
                        \(testingText[TypeOfAddition.hyperlink] ?? "") 
                        \(testingText[TypeOfAddition.image] ?? "")\n
                        """
        
        return textView
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.setTitle( "Clear", for: .normal)
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.addAction(UIAction{ _ in
            self.cancelAllAdditions()
        }, for: .touchUpInside)
        return button
    }()
    
    
    
    lazy var segmentedControl: UISegmentedControl = {
        var segments = UISegmentedControl (items: segmentSetAction())
        return segments
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        oldText = NSAttributedString(string: textViewField.text, attributes: [.font:UIFont.systemFont(ofSize: fontSize)])
        newText = NSMutableAttributedString(string: textViewField.text, attributes: [.font:UIFont.systemFont(ofSize: fontSize)])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
        
    }
    
    private func configureUI() {
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        [textViewField, cancelButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        
        
        NSLayoutConstraint.activate([
            textViewField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textViewField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textViewField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            segmentedControl.topAnchor.constraint(equalTo: textViewField.bottomAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 60),
            
            cancelButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cancelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            cancelButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
        
    }
    
    ///Установка действий и названия для каждого сегмента UISegmentedControl
    private func  segmentSetAction() -> [UIAction] {
        
        var actions : [UIAction] = []
        
        for title in nameOfSections {
            if let type = TypeOfAddition(rawValue: title.rawValue) {
                switch type {
                case .color :
                    actions.append(UIAction(title: type.rawValue, handler: { _ in
                        self.setSegmentColor()
                    }))
                case .font :
                    actions.append(UIAction(title: type.rawValue, handler: { _ in
                        self.setSegmentFont()
                    }))
                case .underline :
                    actions.append(UIAction(title: type.rawValue, handler: { _ in
                        self.setSegmentUnderline()
                    }))
                case .hyperlink :
                    actions.append(UIAction(title: type.rawValue, handler: { _ in
                        self.setSegmentHyperlink()
                    }))
                case .image :
                    actions.append(UIAction(title: type.rawValue, handler: { _ in
                        self.setSegmentImage()
                    }))
                }
            }
        }
        
        if actions.count > 0 {
            segmentedControl = UISegmentedControl(frame: .zero, actions: actions)
            return actions
        }
        return actions
    }
    
    private func setSegmentColor()  {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize)
        ]
        changeText(attributes: attributes, whichText: testingText[.color] ?? "" )
    }
    
    private func setSegmentFont()  {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "BrandaRegular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize),
        ]
        changeText(attributes: attributes, whichText: testingText[.font] ?? "")
    }
    
    private func setSegmentUnderline()  {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize),
            .underlineStyle: NSUnderlineStyle.double.rawValue,
            .underlineColor: UIColor.green,
        ]
        changeText(attributes: attributes, whichText: testingText[.underline] ?? "")
    }
    
    private func setSegmentHyperlink()  {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize),
            .foregroundColor: UIColor.systemBlue,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: UIColor.systemBlue,
        ]
        changeText(attributes: attributes, whichText: testingText[.hyperlink] ?? "")
    }
    
    private func setSegmentImage(){
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize),
        ]
        changeText(attributes: attributes, whichText: testingText[.image] ?? "")
    }
    
    
    private func cancelAllAdditions() {
        textViewField.attributedText = oldText
        guard let text = oldText else {return}
        newText?.setAttributedString(text)
    }
    
    
    ///метод непосредственно изменяет текст в textView в зависимости от выбранного сегмента на UISegmentedControl
    private func changeText(attributes: [NSAttributedString.Key: Any] , whichText: String ) {
        
        let actualText = self.textViewField.attributedText.string
        
        var attributesToUse = attributes
        
        if let  toFind = actualText.ranges(of: whichText ).first {
            
            if whichText.contains("https") {
                attributesToUse[.link] = URL(string: whichText)
                let nsRange = NSRange(toFind, in: actualText)
                newText?.addAttributes(attributesToUse, range: nsRange)
                self.textViewField.attributedText = newText
            }
            
            if whichText.contains("color") {
                
                let separatedText: [String] = whichText.split(separator: " ").map { subs in
                    String(subs)
                }
                
                let colors = [UIColor.red, UIColor.cyan, UIColor.magenta, UIColor.green, UIColor.purple]
                
                for word in separatedText {
                    guard let range = whichText.range(of: word) else { return }
                    let convertedRange = NSRange(range, in: whichText)
                    newText?.addAttributes([NSAttributedString.Key.backgroundColor:
                                                colors[Int.random(in: 0...colors.count-1)]
                                           ], range: convertedRange)
                }
                
                self.textViewField.attributedText = newText
            }
            
            
            if whichText.contains("image") {
                if let image = UIImage(named: "ocean") {
                    let attachment = NSTextAttachment()
                    attachment.image = image
                    attachment.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
                    let imageString = NSAttributedString (attachment: attachment)
                    newText?.append(imageString)
                    self.textViewField.attributedText = newText
                    
                }
            }
            
            else {
                let nsRange = NSRange(toFind, in: actualText)
                newText?.addAttributes(attributesToUse, range: nsRange)
                
                self.textViewField.attributedText = newText
            }
            
            
        }
    }
    
    
    
}

//Создайте экран с использованием UIViewController. На этом экране должен быть
//UITextView для отображения текста.
//Используйте NSAttributedString для создания стилизованного текста в UITextView.
//Ваш текст должен включать следующие атрибуты:
//- Разные цвета для различных слов.
//- Кастомный(прикрепила) шрифт для разных фраз.
//- Подчеркивание для одного из абзацев.
//- Переход по ссылке
//- Картинку
//Реализуйте кнопку на экране. При нажатии на кнопку, текст в UITextView должен
//измениться, добавив новые атрибуты.
//Добавьте еще одну кнопку для сброса текста в исходное состояние (без
//атрибутов).
//Добавьте возможность изменять атрибуты текста (цвет, стиль, размер шрифта)
//с использованием UISegmentedControl или других интерактивных элементов.
