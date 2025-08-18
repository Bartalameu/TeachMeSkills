//
//  ViewController.swift
//  homework_14(UICollectionView)
//
//  Created by Vadzim Pappkou on 17.08.2025.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    private var macintoshDevices: [Item] = [
          Item(title: "iPhone", imageName: "iphone"),
          Item(title: "iPad", imageName: "ipad"),
          Item(title: "MacBook", imageName: "laptopcomputer"),
          Item(title: "Apple Watch", imageName: "applewatch"),
          Item(title: "AirPods", imageName: "airpodspro"),
          Item(title: "Apple TV", imageName: "appletv"),
          Item(title: "iMac", imageName: "desktopcomputer"),
          Item(title: "HomePod", imageName: "hifispeaker")
    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout ()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets (top: 10, left: 10, bottom: 10, right: 10)
        let width = (view.frame.width - 52) / 2
        layout.itemSize = CGSize(width: width  , height: width * 1.5)
        layout.minimumLineSpacing = 16
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.collectionViewLayout = layout
        collection.delegate = self
        collection.dataSource = self
        collection.register(ItemCustomCell.self, forCellWithReuseIdentifier: ItemCustomCell.reusId)

        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configuraionCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        macintoshDevices.capacity
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCustomCell.reusId, for: indexPath) as! ItemCustomCell
        cell.bind(item: macintoshDevices[indexPath.row])
        var frame = cell.ImageView.frame
        frame.size.width = collectionView.frame.width / 2
        cell.ImageView.frame = frame
        return cell
    }
    

    
    private func configuraionCollectionView () {
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }


}

