//
//  kensakuViewController.swift
//  Kondate
//
//  Created by ryusei wakasa on 2016/10/05.
//  Copyright © 2016年 ryusei wakasa. All rights reserved.
//

import UIKit

class kensakuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var ryourinameArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        table.delegate = self
        
        ryourinameArray = ["海鮮丼","鉄火丼","カツ丼","牛丼","天丼"]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ryourinameArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as!
            kensakuTableViewCell
        cell.ryourimeilabel?.text = ryourinameArray[indexPath.row]
        cell.nitijilabel!.text = "2016年10月5日水曜日"
        cell.ryouriview?.image = UIImage(named: "")
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
