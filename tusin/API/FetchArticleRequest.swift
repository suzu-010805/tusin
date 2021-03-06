//
//  FetchArticleRequest.swift
//  tusin
//
//  Created by kids on 2020/01/21.
//  Copyright © 2020 kids. All rights reserved.
//

import Foundation
import APIKit

struct FetchQiitaArticleRequest: QiitaAPI{
    typealias Response = [Article]
    
    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/items"
    }
    
    let query: String?

    var queryParameters: [String : Any]? {
        guard let query = query else {
            return nil
        }
        return ["query":"title:\(query)"]
    }
}
