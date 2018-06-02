//
//  DailyViewController.swift
//  BeProductive
//
//  Created by Student on 2018. 04. 17..
//  Copyright © 2018. Student. All rights reserved.
//

import UIKit

var list: Array<TaskEntry> = []
let defaults = UserDefaults.standard

class DailyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var myTableView: UITableView!

    
    public func getList() -> Array<Any>{
        return list;
    }
    
    public func setList(input: Array<Any>) -> Void{
        list = input as! [TaskEntry]
    }
    
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return (list.count)
        }
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            cell.textLabel?.text = list[indexPath.row].taskName as String
            
            return(cell)
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
        {
            if editingStyle == UITableViewCellEditingStyle.delete
            {
                let alert = UIAlertController(title: "Warning", message: "Are you sure you want to delete this item?", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in
                    self.deleteCell(row: indexPath.row)
                }))
                alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    
    func deleteCell(row: Int) -> Void{
        removeFromList(row: row, list: list)
        reload()
    }
    
    func reload(){
        loadList()
        myTableView.reloadData()
    }
    
    func loadList(){
        let decoded  = defaults.object(forKey: "list") as? Data
        if(decoded != nil){
            list = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Array<TaskEntry>
        }
        else{
            list = []
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        loadList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

