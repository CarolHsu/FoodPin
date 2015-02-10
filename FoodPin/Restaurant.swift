//
//  Restaurant.swift
//  FoodPin
//
//  Created by Hsu Carol on 2015/2/10.
//  Copyright (c) 2015年 Hsu Carol. All rights reserved.
//

import Foundation
import Darwin

class Restaurant {
    var name: String?
    var type: String?
    var location: String?
    var image: String?
    var isVisited: Bool = false
    var phone: String?
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        self.phone = "000-123-\(arc4random_uniform(10))\(arc4random_uniform(10))\(arc4random_uniform(10))"
    }
    
}