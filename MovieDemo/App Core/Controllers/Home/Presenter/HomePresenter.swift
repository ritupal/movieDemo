//
//  HomePresenter.swift
//  MovieDemo
//
//  Created by Ritu Garodia on 05/06/18.
//  Copyright © 2018 Ritu Garodia. All rights reserved.
//

import UIKit

class HomePresenter: NSObject {
    private weak var view: HomeView?
    
    // MARK: - Init function
    init(with view: HomeView) {
        self.view = view
    }
    
    // MARK: - Data function
    func rows() -> Int {
        return 10
    }
    
    func cellIdentifier(for indexPath: IndexPath) -> String {
        return HomeCollectionViewCell.identifier()
    }
    
    
 }
