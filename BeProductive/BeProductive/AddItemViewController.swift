//
//  AddItemViewController.swift
//  BeProductive
//
//  Created by Student on 2018. 05. 26..
//  Copyright © 2018. Student. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    var dateComponents = DateComponents()
    
    let userCalendar = Calendar.current
    
    @IBOutlet weak var input: UITextField!
    
    @IBAction func addItem(_ sender: AnyObject)
    {
        dateComponents.year = 2018
        dateComponents.month = 7
        dateComponents.day = 11
        dateComponents.timeZone = TimeZone(abbreviation: "CFT")
        dateComponents.hour = 8
        dateComponents.minute = 34
        
        
        if (input.text != "")
        {
            let item: TaskEntry = TaskEntry(dueDate: userCalendar.date(from: dateComponents)!, taskName: input.text!)
            
            list.append(item)
            defaults.set(list, forKey: "SavedTasks")
            input.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


