//
//  bigryouriViewController.swift
//  Kondate
//
//  Created by ryusei3 on 2017/07/05.
//  Copyright © 2017年 ryusei wakasa. All rights reserved.
//

import UIKit

class bigryouriViewController: UIViewController {
    
    @IBOutlet var bigryouriview: UIImageView!
    @IBOutlet var bignamaelabel:  UILabel!
    var bigryouri: UIImage!
    var bignamae: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigryouriview.image = bigryouri
        bignamaelabel.text = bignamae
        
        bigryouriview.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swipe(sender: UISwipeGestureRecognizer) {
        
        print("swiped")
        
        //呼び出されたタイミングを確認する。
        self.dismiss(animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
