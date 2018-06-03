//
//  DailyViewController.swift
//  BeProductive
//
//  Created by Student on 2018. 04. 17..
//  Copyright © 2018. Student. All rights reserved.
//

import UIKit

var list: Array<TaskEntry> = []
var todaysList: Array<TaskEntry> = []
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
        return (todaysList.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = todaysList[indexPath.row].taskName as String
        
        return(cell)!
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
    
    //TODO: have to modify this in order to use it with list and today's list
    func deleteCell(row: Int) -> Void{
        removeFromList(row: Int(todaysList[row].taskId)!, list: list)
        reload()
    }
    
    func reload(){
        loadList()
        myTableView.reloadData()
    }
    
    func loadList(){
        // TODO: optimization: save today's date in nsuserdefaults
        // compare that one to today's date from calendar.current
        // reload today's tasks only if the two dates are not equal (so I don't have to reload the whole thing all the time the user enters the app)
        
        let date = Date()
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        let year =  components.year
        let month = components.month
        let day = components.day
        
        let decoded  = defaults.object(forKey: "taskList") as? Data
        if(decoded != nil){
            list = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Array<TaskEntry>
        }
        else{
            list = []
        }
        todaysList = []
       for i in stride(from: 0, to: list.count, by: 1){
            var itemComponent = calendar.dateComponents([.year, .month, .day], from: list[i].dueDate)
            if(itemComponent.year == year! && itemComponent.month == month! && itemComponent.day == day){
                todaysList.append(list[i])
            }
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //destroy()
        tableViewSetup()
        loadList()
    }
    
    func destroy(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "taskList")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableViewSetup() {
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 350
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


}

