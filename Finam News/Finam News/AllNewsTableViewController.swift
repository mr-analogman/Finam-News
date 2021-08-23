//
//  AllNewsTableViewController.swift
//  Finam News
//
//  Created by mr_aNalogman on 8/21/21.
//  Copyright © 2021 mr_aNalogman. All rights reserved.
//

import UIKit

class AllNewsTableViewController: UITableViewController {
    
    let networkService = NetworkService()
    
    //local news array
    var newsArr1: NewsResponse? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.FetchAllNews(query: query) {[weak self] (result) in
            switch result {
    
            case .success(let news):
                self?.newsArr1 = news
                self?.tableView.reloadData()
                newsArr = news
                print(newsArr)
            case .failure(let error):
                print("Error: ", error)
                let alert = UIAlertController(title: "Error", message: "Unable to load news, check internet connection", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Exit", style: .default, handler: { (_) in
                    exit(0)
                }))
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }

    
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArr1?.totalResults ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsItemCell", for: indexPath)

        cell.textLabel?.text = newsArr1?.articles[indexPath.row].title
        cell.detailTextLabel?.text = newsArr1?.articles[indexPath.row].description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNewsRow = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
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
