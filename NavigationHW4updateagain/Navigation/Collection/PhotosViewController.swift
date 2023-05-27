//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Admin on 26.05.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class PhotosViewController:  UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
       
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical


        let collectionView = UICollectionView(frame: .zero,  collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray2
        
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let imagesForPost = ImagesForPost.postModel()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Photo Gallary"
            view.backgroundColor = .white
            navigationController?.navigationBar.isHidden = false

        addSubviews()
        setupConstrains()
    }
    
    private func addSubviews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesForPost.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        
        cell.setupCell(model: imagesForPost[indexPath.row])
        return cell
    }
    
    private var inset: CGFloat { return 8}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let width = (collectionView.bounds.width - inset * 4) / 3
         return CGSize(width: width, height: width)
    }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          inset
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         inset
     }
    
    
}
