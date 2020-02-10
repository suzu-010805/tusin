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

    @IBOutlet weak var tableView: UITableView!
    var articles: [Article]?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = FetchQiitaArticleRequest()
        
        Session.send(request) { result in
            switch result {
            case .success(let response):
                self.articles = response
                self.tableView.reloadData()
                print(response)
                
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }


}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOFArticles = articles?.count else { return 0 }
        return numberOFArticles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = articles?[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Web",bundle:nil)
        let nextViewController = storyboard.instantiateInitialViewController() as? WebViewController
        //
        nextViewController?.openURL = articles?[indexPath.row].url
        navigationController?.pushViewController(nextViewController!, animated: true)
    }
}

