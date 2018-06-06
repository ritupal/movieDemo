//
//  HttpRequest.swift
//  Demo
//
//  Created by Ritu Garodia on 23/12/17.
//  Copyright © 2017 Ritu Garodia. All rights reserved.
//

import Foundation
import SVProgressHUD


typealias JSONDictionary = [String: Any]
typealias HTTPResponse = (JSONDictionary?, String) -> Void
typealias ResponseType = [String: Any]

class HttpRequest {
    
    var errorMsg = ""
    let defalutSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var apiResponse: JSONDictionary?
    
    public func makeNetworkRequest(url: String, parameters: [String: Any]? = nil, completionHandler: @escaping HTTPResponse) {
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.gradient)
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: url) {
            guard let apiURl = urlComponents.url else { return }
            dataTask = defalutSession.dataTask(with: apiURl, completionHandler: { (data, response, error) in
                SVProgressHUD.dismiss()
                defer { self.dataTask = nil }
                if let error = error {
                    self.errorMsg = "Api error: " + error.localizedDescription
                } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    self.getJsonResponse(data: data)
                    DispatchQueue.main.async {
                        completionHandler(self.apiResponse, self.errorMsg)
                    }
                }
            })
            
            dataTask?.resume()
        }
    }
    
    func getJsonResponse(data: Data) {
        do {
            apiResponse = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as Error {
            errorMsg += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
    }

}
