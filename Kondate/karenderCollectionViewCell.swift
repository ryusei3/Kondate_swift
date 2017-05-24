//
//  karenderCollectionViewCell.swift
//  Kondate
//
//  Created by 藤井陽介 on 2016/11/02.
//  Copyright © 2016年 ryusei wakasa. All rights reserved.
//

import UIKit

class karenderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var textLabel: UIButton!
    var btnPushed: (() -> ())!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //textLabel = UIButton(frame: CGRectMake(0,0,self.frame.width, self.frame.height))
        //textLabel. = UIFont(name: "HiraKakuPron-W3", size: 12)!
        //textLabel.textAlignment = NSTextAlignment.Center
        
        //self.addSubview(textLabel!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @IBAction func karenderButton() {
        btnPushed()
    }
}
