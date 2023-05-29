//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Admin on 18.04.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {

    //MARK: - Properties
    
    private(set) var statusText = ""

    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.backgroundColor = .lightGray
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.image = UIImage(named: "space cat")
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.clipsToBounds = true
        return avatarImageView
    }()
        
    private let avatarLabel: UILabel = {
        let avatarLabel = UILabel()
        avatarLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarLabel.text = "Austro Cat"
        avatarLabel.adjustsFontSizeToFitWidth = true
        avatarLabel.minimumScaleFactor = 0.5
        avatarLabel.font = UIFont.boldSystemFont(ofSize: 18)
        avatarLabel.textColor = .black
        return avatarLabel
    }()
        
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "In the dark of Universe"
        label.textColor = .gray
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
        
    private lazy var statusField: UITextField = {
        let statusField = UITextField()
        statusField.backgroundColor = .white
        statusField.layer.cornerRadius = 15
        statusField.placeholder = "Enter your status"
        statusField.textAlignment = .center
        statusField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusField.layer.borderWidth = 1
        statusField.layer.borderColor = UIColor.black.cgColor
        statusField.translatesAutoresizingMaskIntoConstraints = false
        statusField.addTarget(self, action: #selector(enterYourStatus), for: .editingChanged)
        statusField.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        return statusField
    }()
        
    private lazy var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    //MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
        setupAutoLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private func
        
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(avatarImageView)
        addSubview(avatarLabel)
        addSubview(statusButton)
        addSubview(statusLabel)
        addSubview(statusField)
    
    }
        
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            
            avatarLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            avatarLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -60),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
            
            
            statusField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 11),
            statusField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 21),
            statusField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            statusField.heightAnchor.constraint(equalToConstant: 40),
            
            statusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func buttonPressed() {
        statusLabel.text = statusText
        statusField.text = ""
        print("Status Text: \(statusText)")
    }
        
    @objc private func enterYourStatus(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
        
    @objc func hideKeyboard() {
        endEditing(true)
    }
}
