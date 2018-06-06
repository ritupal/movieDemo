//
//  HomeViewController.swift
//  MovieDemo
//
//  Created by Ritu Garodia on 05/06/18.
//  Copyright © 2018 Ritu Garodia. All rights reserved.
//

import UIKit
protocol HomeView: class {
    func realodCollectionData()
}

class HomeViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var collectionHome: UICollectionView!
    var presenter: HomePresenter!
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSettings()
        // Do any additional setup after loading the view.
    }
    //MARK:- Methods
    func defaultSettings() {
        registerCellXibs()
    }
    
    func registerCellXibs() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        self.collectionHome.register(nib, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier())
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    //MARK:- UICollection View DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.rows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionHome.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier(), for: indexPath)
        return cell
    }
    
    //MARK:- UICollection View Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //MARK:- UICollection View flow layout delegate
}

