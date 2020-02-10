//
//  WebViewController.swift
//  tusin
//
//  Created by kids on 2020/02/04.
//  Copyright © 2020 kids. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var openURL: String?

    @IBOutlet weak var Webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let url: URL = URL(string: "google.com")!
        let url: URL = URL(string: openURL!)!
        let urlRequest = URLRequest(url: url)
        Webview.load(urlRequest)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
