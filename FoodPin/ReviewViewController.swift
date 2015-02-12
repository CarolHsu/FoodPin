//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Hsu Carol on 2015/2/12.
//  Copyright (c) 2015年 Hsu Carol. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
    }

}
