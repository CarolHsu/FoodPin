//
//  Restaurant.swift
//  FoodPin
//
//  Created by Hsu Carol on 2015/2/10.
//  Copyright (c) 2015年 Hsu Carol. All rights reserved.
//

import Foundation
import CoreData

class Restaurant {
    @NSManaged var name:String!
    @NSManaged var type:String!
    @NSManaged var location:String!
    @NSManaged var phone:String!
    @NSManaged var image:NSData!
    @NSManaged var isVisited:NSNumber!
}