//
//  karenderViewController.swift
//  Kondate
//
//  Created by 藤井陽介 on 2016/11/02.
//  Copyright © 2016年 ryusei wakasa. All rights reserved.
//

import UIKit

extension UIColor {
    class func lightBlue() -> UIColor {
        return UIColor(red: 92.0 / 255, green: 123.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }
    
    class func lightRed() -> UIColor {
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}

class karenderViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let dateManager = DateManager()
    let daysPerWeek: Int = 7
    let cellMargin: CGFloat = 2.0
    var selectedDate = Date()
    var today: Date!
    let weekArray = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    
    @IBOutlet weak var calenderHeaderView: UIView!
    @IBOutlet weak var calenderCollectionView: UICollectionView!
    @IBOutlet weak var myNavigationItem: UINavigationItem!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.title = changeHeaderTitle(selectedDate)
        myNavigationItem.title = changeHeaderTitle(selectedDate)
        
        calenderCollectionView.delegate = self
        calenderCollectionView.dataSource = self
        calenderCollectionView.backgroundColor = UIColor.white
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        }else {
            return dateManager.daysAcquisition()
        }
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! karenderCollectionViewCell
        if (indexPath.row % 7 == 0) {
            cell.textLabel.setTitleColor(UIColor.lightRed(), for: .normal)
        } else if (indexPath.row % 7 == 6) {
            cell.textLabel.setTitleColor(UIColor.lightBlue(), for: .normal)
        } else {
           cell.textLabel.setTitleColor(UIColor.gray, for: .normal)
        }
        if indexPath.section == 0 {
            cell.textLabel.setTitle(weekArray[indexPath.row], for: .normal)
            cell.btnPushed = {}
        } else {
            cell.textLabel.setTitle(dateManager.conversionDateFormat(indexPath), for: .normal)
            cell.btnPushed = {
                self.performSegue(withIdentifier: "settei", sender: self.dateManager.conversionDate(indexPath))
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin: CGFloat = 8.0
        let width: CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / CGFloat(daysPerWeek)
        let height: CGFloat = width * 1.0
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    func changeHeaderTitle(_ date: Date) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "M/yyyy"
        let selectMonth = formatter.string(from: date as Date)
        return selectMonth
    }
    
    
    @IBAction func tappedHeaderPrevBtn(_ sender: UIButton) {
        selectedDate = dateManager.prevMonth(selectedDate)
        calenderCollectionView.reloadData()
        myNavigationItem.title = changeHeaderTitle(selectedDate)
        //navigationController?.title = changeHeaderTitle(selectedDate)
    }
    
    @IBAction func tappedHeaderNextBtn(_ sender: UIButton) {
        selectedDate = dateManager.nextMonth(selectedDate)
        calenderCollectionView.reloadData()
        myNavigationItem.title = changeHeaderTitle(selectedDate)
        //navigationController?.title = changeHeaderTitle(selectedDate)
    }
    
    
        
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch (segue.destination ,segue.identifier) {
        case (let controller as kakikomiViewController, "settei"?):
            controller.date = (sender as? Date) ?? Date()
        default:
            break
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
