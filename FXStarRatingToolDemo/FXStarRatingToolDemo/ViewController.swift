//
//  ViewController.swift
//  FXStarRatingToolDemo
//
//  Created by Fxxx on 2017/12/5.
//  Copyright © 2017年 Aaron Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rating(_ sender: Any) {
        
        let ratingTool = FXStarRatingTool()
        ratingTool.isAllowHalf = true
        ratingTool.themeColor = UIColor.red
        ratingTool.callBack = { (count: Float) -> () in
            self.label.text = "星级：\(count)星"
        }
        ratingTool.show()
        
    }
    
    
}

