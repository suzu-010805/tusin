//
//  DecodableDataParser.swift
//  tusin
//
//  Created by kids on 2020/01/21.
//  Copyright © 2020 kids. All rights reserved.
//

import Foundation
import APIKit

class DecodableDataParser: APIKit.DataParser {
    var contentType: String? {
        return "application/json"
    }
    
//
//    var cantentType: String? {
//        return "application/json"
//    }
    
    func parse(data: Data) throws -> Any {
        return data
    }
}
