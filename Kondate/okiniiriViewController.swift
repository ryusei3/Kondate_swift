//
//  okiniiriViewController.swift
//  Kondate
//
//  Created by ryusei wakasa on 2016/10/05.
//  Copyright © 2016年 ryusei wakasa. All rights reserved.
//

import UIKit
import CoreData

class okiniiriViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate, TabBarDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var SearchBar: UISearchBar!
    
    var ryourinameArray = [String?]()
    
    var ryouriviewArray = [UIImage?]()
    
    var ryouritimeArray = [NSDate]()
    
    var likenumberArray = [Int]()
    
    var ryouriArray = [(String?, UIImage?, NSDate, Int, Int)]()
    
    var searchResult = [(String?, UIImage?, NSDate, Int, Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        table.dataSource = self
        
        table.delegate = self
        
        SearchBar.delegate = self
        
        SearchBar.enablesReturnKeyAutomatically = false
       
        table.tableHeaderView = SearchBar
        
        self.table.setContentOffset(CGPoint(x: 0.0, y: self.SearchBar.frame.size.height), animated: true)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.03130810799, green: 0.7781472457, blue: 0.8365851684, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9667228596, green: 0.9346891378, blue: 1, alpha: 1)
        
        reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didSelectTab(_ tabBarController: TabBarController) {
        guard let _ = table else {
            return
        }
        
        reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as!
        kensakuTableViewCell
        cell.ryourimeilabel?.text = searchResult[indexPath.row].0
        
        cell.nitijilabel!.text = convertStringFromDate(searchResult[indexPath.row].2)
        
        cell.ryouriview?.image = searchResult[indexPath.row].1
        
        cell.likenumber =  searchResult[indexPath.row].3
        
        
        cell.likeFunc = { i in
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let viewContext = appDelegate.persistentContainer.viewContext
            let query: NSFetchRequest<Kondate> = Kondate.fetchRequest()
            
            let calendar = Calendar(identifier: .gregorian)
            let target = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: self.searchResult[indexPath.row].2 as Date)!
            
            // dateで指定した日の0時0分0秒から23時59分59秒の間にあるかどうかという検索条件
            query.predicate = NSPredicate(format: "SELF.date BETWEEN {%@, %@}",
                                          argumentArray: [target, Date(timeInterval: 24*60*60-1, since: target)])
            let fetchData = try! viewContext.fetch(query)
            
            switch self.searchResult[indexPath.row].4 {
            case 0:
                fetchData[0].asalikenumber = Int32(i)
            case 1:
                fetchData[0].hirulikenumber = Int32(i)
            case 2:
                fetchData[0].yorulikenumber = Int32(i)
            default:
                break
            }
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
            self.reloadData()
        }
        
        if cell.likenumber == 1 {
            cell.likeButton.setImage(#imageLiteral(resourceName: "サンプルのコピー.png"), for: .normal)
            
        }else{
            cell.likeButton.setImage(#imageLiteral(resourceName: "サンプル.png"), for: .normal)
            
        }
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResult.removeAll()
        
        if (SearchBar.text == "") {
            
                for data in ryouriArray {
                    if data.3 == 1 {
                        searchResult.append(data)
                    }
                }

        }else{
            for data in ryouriArray {
                if (data.0?.contains(SearchBar.text!))! {
                    if data.3 == 1 {
                        searchResult.append(data)
                    }
                    
                }
            }
        }
        
        table.reloadData()

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SearchBar.endEditing(true)
        
        searchResult.removeAll()
        
        if (SearchBar.text == "") {
            
            for data in ryouriArray {
                if data.3 == 1 {
                    searchResult.append(data)
                }
            }
        }else{
            for data in ryouriArray {
                if (data.0?.contains(SearchBar.text!))! {
                    if data.3 == 1 {
                         searchResult.append(data)
                    }
                    
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
        performSegue(withIdentifier: "tokakikomiview2" ,sender: searchResult[indexPath.row].2)
        
        table.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "tokakikomiview2") {
            let subVC = (segue.destination as? PageViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.date = sender as! Date        }
    }
    
    func reloadData() {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let query: NSFetchRequest<Kondate> = Kondate.fetchRequest()
        let fetchData = try! viewContext.fetch(query)
        
        ryourinameArray = []
        ryouriviewArray = []
        ryouritimeArray = []
        likenumberArray = []
        ryouriArray = []
        searchResult = []
        
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
            
            likenumberArray.append(Int(data.asalikenumber))
            
            likenumberArray.append(Int(data.hirulikenumber))
            
            likenumberArray.append(Int(data.yorulikenumber))
        }
        
        for i in 0..<ryourinameArray.count {
            if ryouriviewArray[i] != nil && ryourinameArray[i] != nil {
                ryouriArray.append((ryourinameArray[i], ryouriviewArray[i], ryouritimeArray[i], likenumberArray[i], i%3))
            }
            
        }
        for data in ryouriArray {
                if data.3 == 1 {
                    searchResult.append(data)
                }
        }

        
        
        
        table.reloadData()
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

    
    
