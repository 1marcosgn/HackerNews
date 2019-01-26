//
//  NewsFactory.swift
//  HackerNews
//
//  Created by Marcos Garcia on 1/25/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class NewsFactory {
    
    private static var sharedNewsFactory = NewsFactory()
    
    /// Single instance of Flights Factory
    class func shared() -> NewsFactory {
        return sharedNewsFactory
    }
    
    /**
     Creates and returns News based on a Dictionary with the news information
     - parameter news: Array of Dictionaries with information required to build a News Object
     - returns: Array of News
     */
    public func makeNews(news: [[String: Any]]?) -> [News]? {
        var newsArray = [News]()
        guard let news_ = news else {
            return nil
        }
        
        for element in news_ {
            if let newsObject = News.init(information: element) {
                newsArray.append(newsObject)
            }
        }
        return newsArray
    }

}
