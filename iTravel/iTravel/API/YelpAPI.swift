//
//  YelpAPI.swift
//  iTravel
//
//  Created by Paul Junver Soriano on 5/6/21.
//  Copyright © 2021 shijiah2012@gmail.com. All rights reserved.
//

import Foundation


struct YelpAPI {
    

    static func getRestaurants(completion: @escaping ([Point]?) -> Void) {
        
        // ––––– TODO: Add your own API key!
        let apikey = "rUl4DpzNHs11hB3XOk4wW4xtFtOPZGN2KHx1biUH5LnNIgIOM3NMK_IHA_ggqgpaQk7p1BXZr8NEoJmE7p21nW5bhml1WJzHzTsQIYkVhtH6hI-0dPQczjqJa46UYHYx"
        
        // Coordinates for San Francisco
        let lat = 37.773972
        let long = -122.431297
        
        
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
                // ––––– TODO: Get data from API and return it using completion
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let restDict = dataDictionary["businesses"] as! [[String: Any]]
                
                let restaurants = restDict.map({ Point.init(dict: $0) })
                
                // Using For Loop
//                var restaurants: [Restaurant] = []
//                for dictionary in dataDictionary {
//                    let restaurant = Restaurant.init(dict: dictionary as! [String : Any])
//                    restaurants.append(restaurant)
//                }

                                
                return completion(restaurants)
                
                }
            }
        
            task.resume()
        
        }
    
    

    
}

    
