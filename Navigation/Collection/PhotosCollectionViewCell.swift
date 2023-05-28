//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Admin on 27.05.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
   
    private let imagesForPostView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        custmizeCell()
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews(){
        contentView.addSubview(imagesForPostView)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     private func custmizeCell() {
           contentView.backgroundColor = .white
    }
    
    func setupCell(model: ImagesForPost) {
        imagesForPostView.image = UIImage(named: model.pictures)
       }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imagesForPostView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagesForPostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagesForPostView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imagesForPostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
}
