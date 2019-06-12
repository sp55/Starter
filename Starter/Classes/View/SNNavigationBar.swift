//
//  SNNavigationBar.swift
//  ShowNow
//
//  Created by apple on 2019/6/6.
//  Copyright © 2019 apple. All rights reserved.

//自定义导航条

import UIKit
import SnapKit

class SNNavigationBar: UIView {
    var titleLabel:UILabel!//标题
    var seperatorLine:UILabel!//分割线
    var backgroundView:UIView!//背景view
    var backBtn:UIButton!//返回按钮
    var backActionBlock:(()->())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        backgroundView = UIView.init()
        titleLabel = UILabel.init()
        titleLabel.backgroundColor = UIColor.blue;
        titleLabel.text = "标题"
        titleLabel.textAlignment = NSTextAlignment.center
        seperatorLine = UILabel.init()
        seperatorLine.backgroundColor = UIColor.yellow
        backBtn = UIButton.init()
        backBtn.setTitle("返回", for: .normal)
        backBtn.tag = 1
        backBtn.backgroundColor=UIColor.black
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside);
        self.addSubview(backgroundView)
        backgroundView.addSubview(titleLabel);
        backgroundView.addSubview(backBtn);
        backgroundView.addSubview(seperatorLine);
    }
    
    //按钮点击事件
    @objc func backAction(sender: UIButton) {
        print(sender.tag)
        backActionBlock?()
    }
    
    override func layoutSubviews() {
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(backgroundView)
            make.height.equalTo(backgroundView)
            make.width.equalTo(150)
        }
        
        seperatorLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(3.5);
        }
    
        backBtn.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(0);
            make.width.equalTo(80);
        }
    }
    
    
}
