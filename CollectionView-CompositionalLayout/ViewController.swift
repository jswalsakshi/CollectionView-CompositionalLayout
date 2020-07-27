//
//  ViewController.swift
//  CollectionView-CompositionalLayout
//
//  Created by Sakshi Jaiswal on 27/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        getUsers()
    }
    
    func getUsers() {
        NetworkingService.requestUsers { (result) in
            switch result {
            case .success(let users):
                print(users)
            case .failure(let error):
                print(error)
            }
        }
    }
}

