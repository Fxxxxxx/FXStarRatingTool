//
//  FXStarRatingTool.swift
//  FXStarRatingTool
//
//  Created by Fxxx on 2017/12/4.
//  Copyright © 2017年 Aaron Feng. All rights reserved.
//

import UIKit

class FXStarRatingTool: NSObject {
    
    open var themeColor = UIColor.blue
    open var isAllowHalf = false
    open var callBack:((Float) -> ())?
    private var count: Float = 0.0
    
    private lazy var showView: UIView = {
       
        let view = UIView.init(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.6)
        
        let backView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        backView.center = view.center
        view.addSubview(backView)
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10.0
        backView.backgroundColor = UIColor.white
        
        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 35))
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = "请评价"
        titleLabel.textColor = UIColor.init(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        backView.addSubview(titleLabel)
        
        let cancalBtn = UIButton.init(frame: CGRect.init(x: 0, y: 160, width: 150, height: 40))
        cancalBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        cancalBtn.setTitleColor(UIColor.init(red: 153/255, green: 153/255, blue: 153/255, alpha: 1), for: .normal)
        cancalBtn.setTitle("取消", for: .normal)
        cancalBtn.addTarget(self, action: #selector(cancelAction(sender:)), for: .touchUpInside)
        backView.addSubview(cancalBtn)
        
        let sureBtn = UIButton.init(frame: CGRect.init(x: 150, y: 160, width: 150, height: 40))
        sureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        sureBtn.setTitleColor(themeColor, for: .normal)
        sureBtn.setTitle("评价", for: .normal)
        sureBtn.addTarget(self, action: #selector(sureAction(sender:)), for: .touchUpInside)
        backView.addSubview(sureBtn)
        
        let starView = FXRatingBar.init(frame: CGRect.init(x: (300 - 235) / 2, y: (200 - 24) / 2, width: 235, height: 24))
        starView.isAllowHalf = isAllowHalf
        starView.callBack = { (scount: Float) -> () in
            self.count = scount
        }
        backView.addSubview(starView)
        
        let topLine = UIView.init(frame: CGRect.init(x: 10, y: 36, width: 280, height: 0.5))
        topLine.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        backView.addSubview(topLine)
        
        let bottomLine = UIView.init(frame: CGRect.init(x: 10, y: 159, width: 280, height: 0.5))
        bottomLine.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        backView.addSubview(bottomLine)
        
        let centerLine = UIView.init(frame: CGRect.init(x: 150, y: 165, width: 0.5, height: 30))
        centerLine.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        backView.addSubview(centerLine)
        
        return view
        
    }()
    
    func show() {
        
        UIApplication.shared.keyWindow?.addSubview(self.showView)
        
    }
    
    @objc private func cancelAction(sender: UIButton) {
        
        showView.removeFromSuperview()
        
    }
    
    @objc private func sureAction(sender: UIButton) {
        
        self.showView.removeFromSuperview()
        callBack?(count)
        
    }
    
}
