//
//  Moldeable.swift
//  CLApp
//
//  Created by cl-macmini-68 on 29/03/17.
//  Copyright © 2017 Click-Labs. All rights reserved.
//

import Foundation

// MARK: - Genric function will return array of model.
protocol SerializableArray {
  init?(with param: [String: Any])
}

extension Sequence where Iterator.Element == [String: Any] {
  func toModelArray<T: SerializableArray>() -> [T] {
    var tempArray = [T]()
    for rawObject in self {
      if let object = T(with: rawObject) {
        tempArray.append(object)
      }
    }
    return tempArray
  }
}

// TODO: JSONRepresentable
protocol JSONRepresentable {
  var JSONRepresentation: Any { get }
}

protocol JSONSerializable: JSONRepresentable {
}

extension JSONSerializable {
  var JSONRepresentation: Any {
    var representation = [String: Any]()
    
    for case let (label?, value) in Mirror(reflecting: self).children {
      switch value {
      case let value as JSONRepresentable:
        representation[label] = value.JSONRepresentation
        
      case let value as NSObject:
        representation[label] = value
        
      default:
        // Ignore any unserializable properties
        break
      }
    }
    
    return representation
  }
}


extension JSONSerializable {
  func toJSON() -> String? {
    let representation = JSONRepresentation
    
    guard JSONSerialization.isValidJSONObject(representation) else {
      return nil
    }
    
    do {
      let data = try JSONSerialization.data(withJSONObject: representation, options: [])
      return String(data: data, encoding: String.Encoding.utf8)
    } catch {
      return nil
    }
  }
}
