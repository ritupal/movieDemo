//
//  Movie.swift
//  MovieDemo
//
//  Created by Ritu Garodia on 06/06/18.
//  Copyright © 2018 Ritu Garodia. All rights reserved.
//

import UIKit

class Movie: SerializableArray {
    var id: String
    var title: String?
    var poster: String?
    var overview: String?
    var rating: Int?
    var releaseDate: String?
    
    required init?(with param: [String : Any]) {
        if let id = param["id"] as? String {
            self.id = id
        } else {
            return nil
        }
        self.title = param["title"] as? String
        self.poster = param["poster_path"] as? String
        self.overview = param["overview"] as? String
        self.rating = param["vote_average"] as? Int
        self.releaseDate = param["release_date"] as? String
    }
    
    }
