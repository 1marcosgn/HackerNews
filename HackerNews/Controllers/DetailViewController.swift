//
//  DetailViewController.swift
//  HackerNews
//
//  Created by Marcos Garcia on 1/25/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var news: News?
    
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ContentText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerImage.imageFromServerURL(urlString: news?.urlToImage)
        titleLabel.text = news?.title
        descriptionLabel.text = news?.description
        ContentText.text = news?.content
    }

    convenience init(newsObject: News) {
        self.init()
        self.news = newsObject
    }
}
