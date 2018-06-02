//
//  TaskEntryDefinition.swift
//  BeProductive
//
//  Created by Student on 2018. 06. 01..
//  Copyright © 2018. Student. All rights reserved.
//

import Foundation
public class TaskEntry: NSObject, NSCoding {
    var taskName: String
    var dueDate: Date
    
    init(taskName: String, dueDate: Date) {
        self.taskName = taskName
        self.dueDate = dueDate
    }
    
    required convenience public init(coder aDecoder: NSCoder) {
        let taskName = aDecoder.decodeObject(forKey: "taskName") as! String
        let dueDate = aDecoder.decodeObject(forKey: "dueDate") as! Date
        
        self.init(taskName: taskName, dueDate: dueDate)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(taskName, forKey: "taskName")
        aCoder.encode(dueDate, forKey: "dueDate")
    }
}
