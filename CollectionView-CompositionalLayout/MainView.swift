//
//  MainView.swift
//  CollectionView-CompositionalLayout
//
//  Created by Sakshi Jaiswal on 27/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        backgroundColor = .blue
    }
    
}
