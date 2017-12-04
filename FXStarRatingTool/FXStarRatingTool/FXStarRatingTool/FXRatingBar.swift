//
//  FXRatingBar.swift
//  FXStarRatingTool
//
//  Created by Fxxx on 2017/12/4.
//  Copyright © 2017年 Aaron Feng. All rights reserved.
//

import UIKit

class FXRatingBar: UIView {
    
    private let yellowView = UIView()
    private let starWidth: CGFloat = 47.0
    
    var isAllowHalf = false
    var callBack:((Float) -> ())?
    
    private lazy var imageBundle: Bundle = {
       
        let path = Bundle.init(for: FXStarRatingTool.classForCoder()).path(forResource: "star", ofType: "bundle")
        return Bundle.init(path: path!)!
        
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "gray", in: imageBundle, compatibleWith: nil)!)
        yellowView.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "yellow", in: imageBundle, compatibleWith: nil)!)
        yellowView.frame = CGRect.init(x: 0, y: 0, width: 0, height: frame.size.height)
        self.addSubview(yellowView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let item = touches.first
        let point = item?.location(in: self)
        yellowView.frame = CGRect.init(x: 0, y: 0, width: point!.x, height: self.bounds.size.height)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let item = touches.first
        let point = item?.location(in: self)
        var count = point!.x / starWidth
        count = count < 0 ? 0 : count
        count = count > 5 ? 5 :count
        if isAllowHalf {
            count = ceil(count / 0.5) * 0.5
        }else {
            count = ceil(count)
        }
        yellowView.frame = CGRect.init(x: 0, y: 0, width: count * 47, height: self.bounds.size.height)
        callBack?(Float(count))
        
    }

}
