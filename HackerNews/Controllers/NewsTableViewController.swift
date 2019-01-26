//
//  NewsTableViewController.swift
//  HackerNews
//
//  Created by Marcos Garcia on 1/25/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

enum Action {
    case openSafari
    case openDetail
}

class NewsTableViewController: UITableViewController {
    // Global variable to manage news
    var news = [News]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNews()
    }
}

/// Extension to Set up Table
extension NewsTableViewController {
    func configureTableView() {
        let nib = UINib(nibName: "NewsTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "news")
        tableView.separatorColor = UIColor.black
        tableView.backgroundColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func configureNews() {
        let services = ServicesImplementer.init()
        let factory = NewsFactory.shared()
        
        // CREATE A FUNCTION FOR THIS
        services.downloadFileFromURL { [weak self] (success, info) in
            if success {
                guard let news_ = factory.makeNews(news: info) else {
                    return
                }
                self?.news = news_
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

/// Extension to manage Cell Operations
extension NewsTableViewController {
    func openDetailViewWith(_ action: Action?, _ newsObject: News, _ url: URL? = nil) {
        if action == .openSafari {
            guard let url_ = url else {
                return
            }
            if !UIApplication.shared.canOpenURL(url_) {
                showAlert()
            }
            UIApplication.shared.open(url_, options: [:], completionHandler: nil)
        } else if action == .openDetail {
            let detailVC = DetailViewController.init(newsObject: newsObject)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Invalid URL", message: "Detail view not available", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
    }
}

// Extension to manage Table View Logic
extension NewsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as! NewsTableViewCell
        // Configure the cell...
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        let newsObject = news[indexPath.row]
        cell.title.text = newsObject.title
        cell.subtitle.text = newsObject.author
        cell.imageBanner.imageFromServerURL(urlString: newsObject.urlToImage)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsObject = news[indexPath.row]
        if let author = newsObject.author,
            let validURL = URL(string: author) {
            openDetailViewWith(.openSafari, newsObject, validURL)
        } else {
            openDetailViewWith(.openDetail, newsObject)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 271.0
    }
}

// Extension to download the images
extension UIImageView {
    public func imageFromServerURL(urlString: URL?) {
        image = nil
        
        guard let imageURL = urlString else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL, completionHandler: { [weak self] (data, response, error) -> Void in
            if error != nil {
                print(error.debugDescription)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self?.image = image
            })
        }).resume()
    }
}
