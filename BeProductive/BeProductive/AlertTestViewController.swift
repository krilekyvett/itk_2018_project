//
//  AlertTestViewController.swift
//  BeProductive
//
//  Created by Student on 2018. 05. 30..
//  Copyright © 2018. Student. All rights reserved.
//

import UIKit
class AlertTestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var itemsToLoad: [String] = ["One", "Two", "Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        self.view.addSubview(myTableView)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemsToLoad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath)
        
        cell.textLabel?.text = self.itemsToLoad[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])")
    }
    
    private func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let shareAction  = UITableViewRowAction(style: .normal, title: "Share") { (rowAction, indexPath) in
            print("Share Button tapped. Row item value = \(self.itemsToLoad[indexPath.row])")
            
            self.displayShareSheet(indexPath: indexPath as NSIndexPath)
        }
        let deleteAction  = UITableViewRowAction(style: .default, title: "Delete") { (rowAction, indexPath) in
            print("Delete Button tapped. Row item value = \(self.itemsToLoad[indexPath.row])")
        }
        shareAction.backgroundColor = UIColor.green
        return [shareAction,deleteAction]
    }
    
    func displayShareSheet(indexPath: NSIndexPath)
    {
        let alertController = UIAlertController(title: "Action Sheet", message: "What would you like to do?", preferredStyle: .actionSheet)
        
        let shareViaFacebook = UIAlertAction(title: "Share via Facebook", style: .default, handler: { (action) -> Void in
            print("Send now button tapped for value \(self.itemsToLoad[indexPath.row])")
        })
        
        let shareViaEmail = UIAlertAction(title: "Share via Email", style: .default, handler: { (action) -> Void in
            print("Delete button tapped for value \(self.itemsToLoad[indexPath.row])")
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
            self.myTableView.setEditing(false, animated: true)
        })
        
        alertController.addAction(shareViaFacebook)
        alertController.addAction(shareViaEmail)
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
    }
    
    
}
