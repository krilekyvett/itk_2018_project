//
//  TaskEntryDefinition.swift
//  BeProductive
//
//  Created by Student on 2018. 06. 01..
//  Copyright © 2018. Student. All rights reserved.
//

import Foundation
/**
 Definition of the custom datatype: TaskEntry.
 */
public class TaskEntry: NSObject, NSCoding {
    var taskId: String
    var taskName: String
    var dueDate: Date
    
    init(taskId: String, taskName: String, dueDate: Date) {
        self.taskId = taskId;
        self.taskName = taskName
        self.dueDate = dueDate
    }
    
    required convenience public init(coder aDecoder: NSCoder) {
        let taskId = aDecoder.decodeObject(forKey: "taskId") as? String
        let taskName = aDecoder.decodeObject(forKey: "taskName") as! String
        let dueDate = aDecoder.decodeObject(forKey: "dueDate") as! Date
        
        self.init(taskId: taskId!, taskName: taskName, dueDate: dueDate)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(taskId, forKey: "taskId")
        aCoder.encode(taskName, forKey: "taskName")
        aCoder.encode(dueDate, forKey: "dueDate")
    }
}
