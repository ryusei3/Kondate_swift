//
//  kensakuTableViewCell.swift
//  Kondate
//
//  Created by ryusei wakasa on 2016/10/05.
//  Copyright © 2016年 ryusei wakasa. All rights reserved.
//

import UIKit
import CoreData

class kensakuTableViewCell: UITableViewCell {
    
    @IBOutlet var ryourimeilabel: UILabel!
    @IBOutlet var nitijilabel: UILabel!
    @IBOutlet var ryouriview: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    var likeFunc: ((Int)->())!
    
    var likenumber:Int = 0
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func sukiButton() {
        
        print("いいね！")
        
        if likenumber == 1 {
            likeButton.setImage(#imageLiteral(resourceName: "サンプルのコピー.png"), for: .normal)
            likenumber = 0
            likeFunc(0)
        }else{
            likeButton.setImage(#imageLiteral(resourceName: "サンプル.png"), for: .normal)
            likenumber = 1
            likeFunc(1)
        }
    
        
    }
    
    

}
