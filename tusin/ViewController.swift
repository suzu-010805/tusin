//
//  ViewController.swift
//  tusin
//
//  Created by kids on 2020/01/18.
//  Copyright © 2020 kids. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = FetchQiitaArticleRequest()
        
        Session.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
                
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }


}

