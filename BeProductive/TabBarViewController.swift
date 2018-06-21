//
//  TabBarViewController.swift
//  BeProductive
//
//  Created by Student on 2018. 06. 21..
//  Copyright © 2018. Student. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    @IBOutlet weak var myTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
       // R:201 G: 84 B: 74
        myTabBar.barTintColor = UIColor(red: 201 / 255.0, green: 84/255.0, blue: 74/255.0, alpha: 1.00)
        myTabBar.tintColor = UIColor.white
        // Do any additional setup after loading the view.
        // R: 229 G: 229 B: 231
        myTabBar.unselectedItemTintColor = UIColor(red: 229 / 255.0, green: 229/255.0, blue: 231/255.0, alpha: 0.6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
