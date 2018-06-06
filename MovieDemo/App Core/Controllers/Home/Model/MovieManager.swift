//
//  MovieManager.swift
//  MovieDemo
//
//  Created by Ritu Garodia on 07/06/18.
//  Copyright © 2018 Ritu Garodia. All rights reserved.
//

import UIKit
typealias movieCallBack = ((_ response: Any?, _ error: String?) -> Void)

class MovieManager: NSObject {
    class func getPopularMovies(pageNumber: Int, competionHandler: @escaping movieCallBack) {
        let url = "\(ApiUrl.home.rawValue)?api_key=\(AppInfo.apiKey.rawValue)&language=en-US&page=\(pageNumber)"
        HttpRequest().makeNetworkRequest(url: url) { (response, error) in
            if error.count == 0 {
                //parse the response
                var popularMovies = [Movie]()
                guard let responseData = response, let arrResult = responseData["results"] as? [ResponseType] else {
                    return
                }
                popularMovies = arrResult.toModelArray()
                print("arrResult \(popularMovies)")
                competionHandler(popularMovies, nil)
            }
            competionHandler(nil, error)
        }
    }

}
