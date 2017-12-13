//
//  PageViewController.swift
//  Kondate
//
//  Created by ryusei3 on 2017/11/22.
//  Copyright © 2017年 ryusei wakasa. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var date: Date!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        self.setViewControllers([getimageview(date: date)], direction: .forward, animated: true, completion: nil)
        let viewcontroller = self.viewControllers![0] as! kakikomiViewController
        self.title = viewcontroller.changeHeaderTitle(date)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1046803971, green: 0.7349821891, blue: 0.04140474083, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9667228596, green: 0.9346891378, blue: 1, alpha: 1)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.03130810799, green: 0.7781472457, blue: 0.8365851684, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9667228596, green: 0.9346891378, blue: 1, alpha: 1)
        
        
    }
    
    func getimageview(date: Date) -> kakikomiViewController {
        var controller = storyboard?.instantiateViewController(withIdentifier: "kakikomiviewcontroller") as! kakikomiViewController
        
        controller.date = date
        
        return controller
        
    }
    
    @IBAction func modoruButton() {
        let viewcontroller = self.viewControllers![0] as! kakikomiViewController
        
        let editnumber = viewcontroller.editnumber
        
        if editnumber == 1 {
            
            let alert = UIAlertController(title: "変更内容を破棄してもよろしいですか？", message: "まだ保存されていません", preferredStyle: UIAlertControllerStyle.alert)
            
            let action1 = UIAlertAction(title: "はい", style: UIAlertActionStyle.destructive, handler: {
                (action: UIAlertAction!) in
                print("はいが押されました")
                
                self.navigationController?.popViewController(animated: true)
                
            })
            
            
            
            let cancel = UIAlertAction(title: "いいえ", style: UIAlertActionStyle.cancel, handler: {
                (action: UIAlertAction!) in
                print("いいえをタップした時の処理")
            })
            
            alert.addAction(action1)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }else {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func saveMemo() {
        
        let viewcontroller = self.viewControllers![0] as! kakikomiViewController
        viewcontroller.saveMemo()
        self.navigationController?.popViewController(animated: true)
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

extension PageViewController : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as! kakikomiViewController
        var currentIndex = viewController.date
        let calendar = Calendar(identifier: .gregorian)
        let target = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: currentIndex!)!
        var time2 = target.addingTimeInterval(-24*60*60)
        currentIndex = time2
        
        
        
        return getimageview(date: currentIndex!)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as! kakikomiViewController
        var currentIndex = viewController.date
        let calendar = Calendar(identifier: .gregorian)
        let target = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: currentIndex!)!
        var time = target.addingTimeInterval(24*60*60)
        currentIndex = time
        
        
        return getimageview(date: currentIndex!)
        
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let viewcontroller = self.viewControllers![0] as! kakikomiViewController
        self.title = viewcontroller.changeHeaderTitle(viewcontroller.date)
        
    }
    
}
