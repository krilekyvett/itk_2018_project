//
//  Utils.swift
//  BeProductive
//
//  Created by Student on 2018. 06. 02..
//  Copyright © 2018. Student. All rights reserved.
//

import Foundation

public func appendToList(item: TaskEntry) {
    var storedList: Array<TaskEntry> = []
    let defaults = UserDefaults.standard
    let decoded  = defaults.object(forKey: "taskList") as? Data
    if(decoded != nil){
        storedList = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Array<TaskEntry>
    }
    storedList.append(item)
    // defaults.set(storedList, forKey: "list")
    defaults.set(NSKeyedArchiver.archivedData(withRootObject: storedList), forKey: "taskList")
    //defaults.synchronize()
}

public func removeFromList(row: Int, list: Array<TaskEntry>) {
    
    var storedList = list
    let defaults = UserDefaults.standard
    /*let decoded  = defaults.object(forKey: "list") as? Data
    if(decoded != nil){
        storedList = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Array<TaskEntry>
    }*/
    
    
    for i in stride(from: 0, to: storedList.count, by: 1){
        if(Int(storedList[i].taskId) == row){
            storedList.remove(at: i)
            break
        }
    }
    defaults.set(NSKeyedArchiver.archivedData(withRootObject: storedList), forKey: "taskList")
    //defaults.synchronize()
}


