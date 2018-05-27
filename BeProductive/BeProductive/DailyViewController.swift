//
//  DailyViewController.swift
//  BeProductive
//
//  Created by Student on 2018. 04. 17..
//  Copyright © 2018. Student. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var myTableView: UITableView!
    
    
    
    var list: Array<Any> = ["Reading: War and Peace", "Buy groceries", "Finish assignment"]
    
    public func getList() -> Array<Any>{
        return list;
    }
    
    public func setList(input: Array<Any>) -> Void{
        list = input as! [String]
    }
    
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return (list.count)
        }
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            cell.textLabel?.text = list[indexPath.row] as! String
            
            return(cell)
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
        {
            if editingStyle == UITableViewCellEditingStyle.delete
            {
                list.remove(at: indexPath.row)
                myTableView.reloadData()
            }
        }
        
        override func viewDidAppear(_ animated: Bool) {
            myTableView.reloadData()
        }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        // does it change?
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

