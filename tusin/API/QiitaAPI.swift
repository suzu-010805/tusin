//
//  QiitaAPI.swift
//  tusin
//
//  Created by kids on 2020/01/21.
//  Copyright © 2020 kids. All rights reserved.
//

import Foundation
import APIKit

protocol QiitaAPI: Request {}

extension QiitaAPI {
    var baseURL: URL {
        return URL(string: "https://qiita.com/api/v2")!
    }
}

extension QiitaAPI where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        
        return try JSONDecoder().decode(Response.self,from: data)
    }

}

