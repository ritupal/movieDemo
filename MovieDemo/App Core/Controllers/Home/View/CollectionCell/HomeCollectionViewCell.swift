//
//  HomeCollectionViewCell.swift
//  MovieDemo
//
//  Created by Ritu Garodia on 05/06/18.
//  Copyright © 2018 Ritu Garodia. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func identifier() -> String {
        return String(describing: HomeCollectionViewCell.self)
    }

}
