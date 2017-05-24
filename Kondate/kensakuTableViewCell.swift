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
    
    var date: Date!
    
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
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let query: NSFetchRequest<Kondate> = Kondate.fetchRequest()
        
        let calendar = Calendar(identifier: .gregorian)
        let target = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: date)!
        
        // dateで指定した日の0時0分0秒から23時59分59秒の間にあるかどうかという検索条件
        query.predicate = NSPredicate(format: "SELF.date BETWEEN {%@, %@}",
                                      argumentArray: [target, Date(timeInterval: 24*60*60-1, since: target)])
        let fetchData = try! viewContext.fetch(query)
        
        if likenumber == 1 {
            likeButton.setImage(#imageLiteral(resourceName: "liked.png"), for: .normal)
            likenumber = 0
            fetchData[0].likenumber = 0
            likeFunc(0)
        }else{
            likeButton.setImage(#imageLiteral(resourceName: "サンプル.png"), for: .normal)
            likenumber = 1
            fetchData[0].likenumber = 1
            likeFunc(1)
        }
    
        do {
            try viewContext.save()
        } catch {
            print(error)
        }

    }
    
    

}
