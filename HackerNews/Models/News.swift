//
//  News.swift
//  HackerNews
//
//  Created by Marcos Garcia on 1/25/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

struct News {
    let author: String?
    let urlToImage: URL
    let title: String
    let description: String
    let content: String?
    
    init?(information:[String: Any]) {
        self.author = information["author"] as? String
        
        guard let urlString = information["urlToImage"] as? String,
            let title_ = information["title"] as? String,
            let description_ = information["description"] as? String else {
                return nil
        }
        
        guard let urlToImage_ = URL(string: urlString) else {
            return nil
        }
        
        self.title = title_
        self.description = description_
        self.urlToImage = urlToImage_
        self.content = information["content"] as? String
    }
}
