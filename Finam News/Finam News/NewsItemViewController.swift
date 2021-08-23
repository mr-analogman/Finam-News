//
//  NewsItemViewController.swift
//  Finam News
//
//  Created by mr_aNalogman on 8/23/21.
//  Copyright © 2021 mr_aNalogman. All rights reserved.
//

import UIKit

class NewsItemViewController: UIViewController {
    
    @IBOutlet weak var NewsImage: UIImageView!
    @IBOutlet weak var NewsTitle: UILabel!
    @IBOutlet weak var NewsText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        NewsTitle.text = newsArr.articles[selectedNewsRow].title
        NewsText.text = newsArr.articles[selectedNewsRow].description! + " " + newsArr.articles[selectedNewsRow].content! + "\nFull: " + newsArr.articles[selectedNewsRow].url!
        let imgUrl = URL(string: newsArr.articles[selectedNewsRow].urlToImage!)!
        NewsImage.contentMode = .scaleAspectFill
        NewsImage.load(fromUrl: imgUrl)
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

//MARK: Extensions
extension UIImageView {
    func load(fromUrl url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
