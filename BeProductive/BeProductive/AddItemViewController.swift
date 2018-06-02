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
        
        if(input.text! == ""){
            showEmptyNameFieldWarning()
        }
        else{
            appendToList(item: TaskEntry(taskName: input.text!, dueDate: userCalendar.date(from: dateComponents)!))
            input.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func showEmptyNameFieldWarning(){
        let alert = UIAlertController(title: "Warning", message: "You cannot add a task without a name.", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Got it", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


