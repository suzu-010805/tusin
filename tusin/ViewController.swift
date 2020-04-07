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
        
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchArticles()
    }
    
    private func fetchArticles(_ text:String? = nil) {
        let request = FetchQiitaArticleRequest(query: text)
        
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

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            print("nilです")
            return
        }
        fetchArticles(searchText)
    }
}
