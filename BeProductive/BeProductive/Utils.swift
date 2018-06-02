//
//  Utils.swift
//  BeProductive
//
//  Created by Student on 2018. 06. 02..
//  Copyright © 2018. Student. All rights reserved.
//

import Foundation

public func appendToList(item: TaskEntry) {
    var storedList = Array<TaskEntry>()
    let defaults = UserDefaults.standard
    let decoded  = defaults.object(forKey: "list") as? Data
    if(decoded != nil){
        storedList = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Array<TaskEntry>
    }
    storedList.append(item)
    // defaults.set(storedList, forKey: "list")
    defaults.set(NSKeyedArchiver.archivedData(withRootObject: storedList), forKey: "list")
    defaults.synchronize()
}


public func removeFromList(row: Int, list: Array<TaskEntry>) {
    
    var storedList = list
    let defaults = UserDefaults.standard
    /*let decoded  = defaults.object(forKey: "list") as? Data
    if(decoded != nil){
        storedList = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Array<TaskEntry>
    }*/
    storedList.remove(at: row)
    
    defaults.set(NSKeyedArchiver.archivedData(withRootObject: storedList), forKey: "list")
    defaults.synchronize()
}


