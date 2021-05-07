//
//  Point.swift
//  iTravel
//
//  Created by Paul Junver Soriano on 5/6/21.
//  Copyright © 2021 shijiah2012@gmail.com. All rights reserved.
//

import Foundation
import Parse

class Point {
    var imageURL: URL?
    var url: URL?
    var name: String
    var mainCategory: String
    var phone: String
    var rating: Double
    var reviews: PFObject?
    
    init(dict: [String: Any]) {
        imageURL = URL(string: dict["image_url"] as! String)
        name = dict["name"] as! String
        rating = dict["rating"] as! Double
        reviews = dict["review_count"] as? PFObject
        phone = dict["display_phone"] as! String
        url = URL(string: dict["url"] as! String)
        mainCategory = Point.getMainCategory(dict: dict)
    }
    
    // Helper function to get First category from restaurant
    static func getMainCategory(dict: [String:Any]) -> String {
        let categories = dict["categories"] as! [[String: Any]]
        return categories[0]["title"] as! String
    }
    
}
