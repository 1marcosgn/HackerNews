//
//  ServicesImplementer.swift
//  HackerNews
//
//  Created by Marcos Garcia on 1/25/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class ServicesImplementer {
    
    /**
     Simple method to download a JSON from external URL
     - parameter completion: The response of the opetarion
     */
    func downloadFileFromURL(completion: @escaping (Bool, [[String: Any]]?) -> ()) {
        DispatchQueue.global().async {
            
            guard let endpointURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=837fd1b2eaac4f4791f548de49766a89") else {
                return
            }
            
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let request = NSMutableURLRequest(url: endpointURL)
            request.httpMethod = "GET"
            
            let dataTask = session.dataTask(with: request as URLRequest) {
                ( data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    switch(httpResponse.statusCode) {
                    case 200:
                        guard
                            let data = data,
                            let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
                            let info = json["articles"] as? [[String: Any]]
                            else {
                                print("Error", error ?? "")
                                return
                        }
                        completion(true, info)
                    default:
                        print("GET request not successful HTTP status code: \(httpResponse.statusCode)")
                        completion(false, nil)
                    }
                } else {
                    print("Error: Not a valid HTTP response")
                    completion(false, nil)
                }
            }
            dataTask.resume()
        }
    }
}
