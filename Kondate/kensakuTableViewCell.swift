//
//  kensakuTableViewCell.swift
//  Kondate
//
//  Created by ryusei wakasa on 2016/10/05.
//  Copyright © 2016年 ryusei wakasa. All rights reserved.
//

import UIKit

class kensakuTableViewCell: UITableViewCell {
    
    @IBOutlet var ryourimeilabel: UILabel!
    @IBOutlet var nitijilabel: UILabel!
    @IBOutlet var ryouriview: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
