//
//  ViewController.swift
//  homework_13
//
//  Created by Vadzim Pappkou on 12.08.2025.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped )
    let programmingLanguages = ["Swift","Python","JavaScript","Java","C#","C++","Kotlin","Ruby","Go","Rust"]
    
    enum Section: Int, CaseIterable {
        case cellDescript
        case programLang
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
    }
    
// Начало -  Блока методов для UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section (rawValue: section) else {
            return 0
        }
        switch section {
        case .cellDescript:
            return 10
        case .programLang:
            return programmingLanguages.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section (rawValue: section) else {
            return ""
        }
        switch section {
        case .cellDescript:
            return "Raw descripion fo cell:"
        case .programLang:
            return "Programming language:"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        switch section {
        case .programLang:
            let lang = programmingLanguages[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = lang
            return cell
        case .cellDescript:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableView", for: indexPath) as! CustomTableView
            cell.tileLabel.text = String("Number of row - \(indexPath.row)")
            cell.detailLabel.text =  String("Number of section - \(section.rawValue)")
            return cell
      
        
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
    }
    // Конец -  Блока методов для UITableView

    func configureTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableView.self, forCellReuseIdentifier: "CustomTableView")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
       tableView.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
   }

    
}

