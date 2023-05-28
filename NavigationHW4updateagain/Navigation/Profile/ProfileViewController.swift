//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Admin on 12.04.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
   
    //MARK: - Private
        
     private lazy var tableView: UITableView = {
           let tableView = UITableView(frame: .zero, style: .grouped)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.rowHeight = UITableView.automaticDimension
             tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileTableHeaderView")
             tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
             tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
            tableView.delegate = self
            tableView.dataSource = self
            return tableView
       }()

    //MARK: - Override
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.isHidden = true
    }
    
        
    private func setupTableView() {
        view.addSubview(tableView)
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
    }
    


    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return  posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.configure(with: posts[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if section == 0 {
                    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileTableHeaderView") as! ProfileTableHeaderView
                    return header
        } else {
            return nil
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosViewController = PhotosViewController()
        if indexPath.section == 0 {
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 200
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0 {
                return 150
            } else {
                return UITableView.automaticDimension
            }
        }
}
