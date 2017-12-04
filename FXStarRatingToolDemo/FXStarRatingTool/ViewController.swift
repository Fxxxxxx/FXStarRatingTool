//
//  ViewController.swift
//  FXStarRatingTool
//
//  Created by Fxxx on 2017/12/4.
//  Copyright © 2017年 Aaron Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var ratingView: FXStarRatingTool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ratingView = FXStarRatingTool()
        ratingView?.isAllowHalf = true
        ratingView?.themeColor = UIColor.red
        ratingView?.callBack = { (count) -> () in
            
            self.label.text = "星数：\(count)"
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rating(_ sender: Any) {
        
        ratingView?.show()
        
    }
    
}

