//
//  okiniiriViewController.swift
//  Kondate
//
//  Created by ryusei wakasa on 2016/10/05.
//  Copyright © 2016年 ryusei wakasa. All rights reserved.
//

import UIKit

class okiniiriViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table2: UITableView!
    
    var ryouriname2Array = [String]()
    
    var ryouriview2Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table2.dataSource = self
        
        ryouriname2Array = ["海鮮丼","鉄火丼","カツ丼","牛丼","天丼"]
        
        ryouriview2Array = ["海鮮丼.jpg","鉄火丼.jpg","カツ丼.jpg","牛丼.jpg","天丼.jpg"]
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ryouriname2Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! okiniiriTableViewCell
        cell.ryourimeilabel2?.text = ryouriname2Array[indexPath.row]
        cell.nitijilabel2!.text = "2016年10月5日水曜日"
        cell.ryouriview2?.image = UIImage(named: ryouriview2Array[indexPath.row])
        
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
