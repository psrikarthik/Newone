//
//  WelcomeViewController.swift
//  ParseStarterProject
//
//  Created by Karthik on 09/09/2015.
//  Copyright (c) 2015 Parse. All rights reserved.
//


import UIKit
import Parse

class elcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, gender, id, first_name, last_name"])
        graphRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            
            if error != nil {
                println(error)
                
            } else if let result: AnyObject = result {
                
                println(result)
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
