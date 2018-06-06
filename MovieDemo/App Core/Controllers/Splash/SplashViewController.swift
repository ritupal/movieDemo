//
//  SplashViewController.swift
//  MovieDemo
//
//  Created by Ritu Garodia on 05/06/18.
//  Copyright © 2018 Ritu Garodia. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var GetStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
defaultSettings()
        // Do any additional setup after loading the view.
    }

    func defaultSettings() {
        setupUI()
    }
    
    func setupUI() {
        self.GetStartedButton.layer.cornerRadius = 8.0
    }

}
