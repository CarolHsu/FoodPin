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
    @IBOutlet weak var dialogView: UIView!
    
    override func viewDidLoad() {
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        dialogView.transform = CGAffineTransformMakeScale(0.0, 0.0)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: { self.dialogView.transform = CGAffineTransformMakeScale(1, 1) }, completion: nil)
    }

}
