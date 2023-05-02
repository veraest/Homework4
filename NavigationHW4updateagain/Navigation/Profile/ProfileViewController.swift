//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Admin on 12.04.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var posts: [Post] = [
    Post(author: "Solar system",
         description: "Mercury is the first planet of our Solar system.",
         image: "Mercury",
         likes: 1232,
         views: 5967),

    Post(author: "Milkey Way",
         description: "Venus is too hot for any form of life.",
         image: "Venus",
         likes: 487,
         views: 1506),

    Post(author: "Andromeda",
         description: "We'll destroy you one day, the Earth.",
         image: "Earth",
         likes: 59873,
         views: 305667),

    Post(author: "NASA",
         description: "NASA says that the Red Planer is waiting.",
         image: "Mars",
         likes: 65,
         views: 218),
    ]

    //MARK: - Private
        
     private lazy var tableView: UITableView = {
           let tableView = UITableView(frame: .zero, style: .grouped)
           tableView.translatesAutoresizingMaskIntoConstraints = false
           tableView.rowHeight = UITableView.automaticDimension
           tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileTableHeaderView")
           tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
           tableView.delegate = self
           tableView.dataSource = self
           return tableView
       }()

    //MARK: - Override
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    //MARK: - Private func
        
    private func setupTableView() {
        view.addSubview(tableView)
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
        }
    }

    //MARK: - Extension
    
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return posts.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            let post = posts[indexPath.row]
            cell.configure(with: post)
            return cell
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }

        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if section == 0 {
                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileTableHeaderView") as! ProfileTableHeaderView
                return header
            }
            return nil
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section == 0 {
                return 200
            }

            return 0
        }
}



