//
//  DailyViewController.swift
//  BeProductive
//
//  Created by Student on 2018. 04. 17..
//  Copyright © 2018. Student. All rights reserved.
//
// TODO: Tasks due within a week
// TODO: Task entry editing
// TODO: Labels


import UIKit
var thisWeeksList: Array<TaskEntry> = []   // the array of tasks due this week
class ThisWeekViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var noTasksLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //destroy()
        tableViewSetup()
        loadList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reload()
    }
    
    /**
     Returns the current rowcount of todaysList.
     */
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (thisWeeksList.count)
    }
    
    /**
     Fills myTableView with data.
     */
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = thisWeeksList[indexPath.row].taskName as String
        //cell?.backgroundColor = UIColor.green
        return(cell)!
    }
    
    /**
     Enables the delete function on cells.
     */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            let alert = UIAlertController(title: "Warning", message: "Are you sure you want to delete this item?", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in
                self.deleteCell(row: indexPath.row)
            }))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     Helper function for setting up the table view (data source, delegate, rows, identifier).
     */
    func tableViewSetup() {
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 350
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    /**
     Helper function for cell deletion.
     */
    //TODO: have to modify this in order to use it with list and today's list
    func deleteCell(row: Int) -> Void{
        removeFromList(row: Int(thisWeeksList[row].taskId)!, list: list)
        reload()
    }
    
    /**
     Helper function for reloading data.
     */
    func reload(){
        loadList()
        myTableView.reloadData()
    }
    
    /**
     Helper function for data loading and list initialization.
     */
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
        thisWeeksList = []
        for i in stride(from: 0, to: list.count, by: 1){
            var itemComponent = calendar.dateComponents([.year, .month, .day], from: list[i].dueDate)
            if(itemComponent.year! == year! && itemComponent.month! == month! && itemComponent.day! <= day! + 7){
                thisWeeksList.append(list[i])
            }
        }
        
        if(thisWeeksList == []){
            self.view.bringSubview(toFront: noTasksLabel)
        }
    }
    
    /**
     Dev-only: Helper function for deleting the list from NSUserDefaults.
     */
    func destroy(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "taskList")
    }
}


