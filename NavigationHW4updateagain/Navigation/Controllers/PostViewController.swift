//
//  PostViewController.swift
//  Navigation
//
//  Created by Admin on 13.04.2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "Anonymous"
    
        override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
            self.navigationItem.title = titlePost
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(addTapped))    }
    
    @objc func addTapped() {
        
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
