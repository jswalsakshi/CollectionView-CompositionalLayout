//
//  ViewController.swift
//  CollectionView-CompositionalLayout
//
//  Created by Sakshi Jaiswal on 27/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

@available(iOS 14.0, *)
class ViewController: UIViewController {
    
    let mainView = MainView()
    var dataSource: UICollectionViewDiffableDataSource<Section, User>?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        getUsers()
    }
    
    func setUpCollectionView() {
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, User> {
            cell, indexPath, user in
            
            var content = cell.defaultContentConfiguration()
            content.text = user.name
            cell.contentConfiguration = content
            
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, User>(collectionView: mainView.collectionView) {
            collectionView, indexPath, user in
            
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: user)
        }
    }
    
    func getUsers() {
        NetworkingService.requestUsers { (result) in
            switch result {
            case .success(let users):
                print(users)
                self.showCell(with: users )
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showCell(with users: [User]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
        snapshot.appendSections([.main])
        snapshot.appendItems(users)
        dataSource?.apply(snapshot)
    }
}

@available(iOS 14.0, *)
extension ViewController {
    enum Section  {
        case main
    }
}

