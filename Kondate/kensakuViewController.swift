//
//  kensakuViewController.swift
//  Kondate
//
//  Created by ryusei wakasa on 2016/10/05.
//  Copyright © 2016年 ryusei wakasa. All rights reserved.
//

import UIKit
import CoreData

class kensakuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, TabBarDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var testSearchBar: UISearchBar!
    
    var ryourinameArray = [String?]()
    
    var ryouriviewArray = [UIImage?]()
    
    var ryouritimeArray = [NSDate]()
    
    var likenumberArray = [Int]()
    
    var ryouriArray = [(String?, UIImage?, NSDate, Int)]()
    
    var searchResult = [(String?, UIImage?, NSDate, Int)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        table.dataSource = self
        
        table.delegate = self
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let query: NSFetchRequest<Kondate> = Kondate.fetchRequest()
        let fetchData = try! viewContext.fetch(query)
        
        ryourinameArray = []
        ryouriviewArray = []
        ryouritimeArray = []
        likenumberArray = []
        ryouriArray = []
        
        for data in fetchData {
            ryourinameArray.append(data.asagohan)
            
            ryourinameArray.append(data.hirugohan)
            
            ryourinameArray.append(data.yorugohan)
            
            ryouriviewArray.append(UIImage(data: data.asagohanimage as? Data ?? Data()))
            
            ryouriviewArray.append(UIImage(data: data.hirugohanimage as? Data ?? Data()))
            
            ryouriviewArray.append(UIImage(data: data.yorugohanimage as? Data ?? Data()))
            
            ryouritimeArray.append(data.date!)
            
            ryouritimeArray.append(data.date!)
            
            ryouritimeArray.append(data.date!)
            
            likenumberArray.append(Int(data.likenumber))
            
            likenumberArray.append(Int(data.likenumber))
            
            likenumberArray.append(Int(data.likenumber))
        }
        
        
        
            for i in 0..<ryourinameArray.count {
            if ryouriviewArray[i] != nil && ryourinameArray[i]! != nil {
             ryouriArray.append((ryourinameArray[i], ryouriviewArray[i], ryouritimeArray[i], likenumberArray[i]))
            }
            
        }
        
        searchResult = ryouriArray
        
        testSearchBar.delegate = self
        
        testSearchBar.enablesReturnKeyAutomatically = false
        
       


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        table.dataSource = self
        
        table.delegate = self
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let query: NSFetchRequest<Kondate> = Kondate.fetchRequest()
        let fetchData = try! viewContext.fetch(query)
        
        ryourinameArray = []
        ryouriviewArray = []
        ryouritimeArray = []
        likenumberArray = []
        ryouriArray = []
        
        for data in fetchData {
            ryourinameArray.append(data.asagohan)
            
            ryourinameArray.append(data.hirugohan)
            
            ryourinameArray.append(data.yorugohan)
            
            ryouriviewArray.append(UIImage(data: data.asagohanimage as? Data ?? Data()))
            
            ryouriviewArray.append(UIImage(data: data.hirugohanimage as? Data ?? Data()))
            
            ryouriviewArray.append(UIImage(data: data.yorugohanimage as? Data ?? Data()))
            
            ryouritimeArray.append(data.date!)
            
            ryouritimeArray.append(data.date!)
            
            ryouritimeArray.append(data.date!)
            
            likenumberArray.append(Int(data.likenumber))
            
            likenumberArray.append(Int(data.likenumber))
            
            likenumberArray.append(Int(data.likenumber))
        }
        
        
        
        for i in 0..<ryourinameArray.count {
            if ryouriviewArray[i] != nil && ryourinameArray[i]! != nil {
                ryouriArray.append((ryourinameArray[i], ryouriviewArray[i], ryouritimeArray[i], likenumberArray[i]))
            }
            
        }
        
        searchResult = ryouriArray
        
        testSearchBar.delegate = self
        
        testSearchBar.enablesReturnKeyAutomatically = false

        
        table.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func likeButton() {
        print("いいね！")
        
    }
    
   
    
    func didSelectTab(_ tabBarController: TabBarController) {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let query: NSFetchRequest<Kondate> = Kondate.fetchRequest()
        let fetchData = try! viewContext.fetch(query)
        
        ryourinameArray = []
        ryouriviewArray = []
        ryouritimeArray = []
        likenumberArray = []
        ryouriArray = []
        
        for data in fetchData {
            ryourinameArray.append(data.asagohan)
            
            ryourinameArray.append(data.hirugohan)
            
            ryourinameArray.append(data.yorugohan)
            
            ryouriviewArray.append(UIImage(data: data.asagohanimage as? Data ?? Data()))
            
            ryouriviewArray.append(UIImage(data: data.hirugohanimage as? Data ?? Data()))
            
            ryouriviewArray.append(UIImage(data: data.yorugohanimage as? Data ?? Data()))
            
            ryouritimeArray.append(data.date!)
            
            ryouritimeArray.append(data.date!)
            
            ryouritimeArray.append(data.date!)
            
            likenumberArray.append(Int(data.likenumber))
            
            likenumberArray.append(Int(data.likenumber))
            
            likenumberArray.append(Int(data.likenumber))
        }
        
        for i in 0..<ryourinameArray.count {
            if ryouriviewArray[i] != nil && ryourinameArray[i]! != nil {
                ryouriArray.append((ryourinameArray[i], ryouriviewArray[i], ryouritimeArray[i], likenumberArray[i]))
            }
            
        }
        
        searchResult = ryouriArray
        
        table.reloadData()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as!
            kensakuTableViewCell
        cell.ryourimeilabel?.text = searchResult[indexPath.row].0
        
        cell.nitijilabel!.text = convertStringFromDate(searchResult[indexPath.row].2)
        
        cell.ryouriview?.image = searchResult[indexPath.row].1
        
        cell.likenumber =  searchResult[indexPath.row].3
        
        cell.date = searchResult[indexPath.row].2 as Date
        
        cell.likeFunc = { i in
            self.searchResult[indexPath.row].3 = i
        }
        
        if cell.likenumber == 1 {
            cell.likeButton.setImage(#imageLiteral(resourceName: "liked.png"), for: .normal)

        }else{
            cell.likeButton.setImage(#imageLiteral(resourceName: "サンプル.png"), for: .normal)
            
        }
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        testSearchBar.endEditing(true)
        
        searchResult.removeAll()
        
        if (testSearchBar.text == "") {
            searchResult = ryouriArray
        }else{
            for data in ryouriArray {
                if (data.0?.contains(testSearchBar.text!))! {
                    searchResult.append(data)
                }
            }
        }
        
        table.reloadData()
    }
    
    func convertStringFromDate(_ date: NSDate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        
        return dateFormatter.string(from: date as Date)
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "tokakikomiview" ,sender: searchResult[indexPath.row].2)
        
        table.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "tokakikomiview") {
            let subVC = (segue.destination as? kakikomiViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.date = sender as! Date        }
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
