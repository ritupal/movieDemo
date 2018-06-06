//
//  Extensions.swift
//  ODS SP
//
//  Created by soc-macmini-64 on 19/10/16.
//  Copyright © 2016 soc-macmini-64. All rights reserved.
//

import UIKit

//MARK: - UIAlertController
extension UIAlertController {
    
    func present(viewController: UIViewController) {
        viewController.present(self, animated: true, completion: nil)
    }
    
    func present() {
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            self.present(viewController: viewController)
        }
    }
    
    @discardableResult
    func action(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let action: UIAlertAction = UIAlertAction(title: title, style: style, handler: handler)
        self.addAction(action)
        return self
    }
    
    @discardableResult
    class func alert(title: String?, message: String?, style: UIAlertControllerStyle) -> UIAlertController {
        let alertController: UIAlertController  = UIAlertController(title: title, message: message, preferredStyle: style)
        return alertController
    }
    
    @discardableResult
    class func presentAlert(title: String?, message: String?, style: UIAlertControllerStyle) -> UIAlertController {
        let alertController = UIAlertController.alert(title: title, message: message, style: style)
        alertController.present()
        return alertController
    }
    
}

//MARK: - Dictionary
extension Dictionary {

    var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }

}
//MARK: - UITableView
extension  UITableView {
    
    func registerCell(_ nibName: String, identifier: String = "", bundle: Bundle? = nil ) {
        var identifier = identifier
        if identifier.isEmpty {
            identifier = nibName
        }
        let nib: UINib = UINib(nibName: nibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func hideLastCellLine() {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0.01))
        view.backgroundColor = UIColor.clear
        self.tableFooterView = view
    }

}

enum AppDateFormat: String {
    case basic = "yyyy-MM-dd"
    case releaseFormar = "MMM dd yyyy"
}
