//
//  ClubsTableViewController.swift
//  PartyApp
//
//  Created by Karthik on 10/09/2015.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class ClubsTableViewController: UITableViewController {
    
//    @IBOutlet var clubImage: UIImageView!
//    @IBOutlet var clubName: UILabel!
    var clubs = [String]()
    var clubPics = [UIImage]()
    var clubObjects = [PFObject]()
    var clubAddress = [String]()
    var clubType = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cQuery = PFQuery(className: "Club")
        cQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if error == nil {
                
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        
                        self.clubs.append(object["ClubName"] as! String)                // appending clubnames
                        self.clubObjects.append(object)                                 // club objects array
                        self.clubAddress.append(object["ClubAddress"] as! String)       // club addresses
                        self.clubType.append(object["clubType"] as! String)             // club Type
                        
                        
                        let imageFile = object["clubLogo"] as! PFFile
                        
                        imageFile.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            
                            if error != nil {
                                
                                print(error)
                                
                            } else {
                                
                                if let data = imageData {
                                    
                                    self.clubPics.append(UIImage(data: data)!)
                                    
                                    self.tableView.reloadData()
                                }
                            }
                        }
                        
                    }
                }
                
            }
        }
        self.tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return clubs.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dCell = tableView.dequeueReusableCellWithIdentifier("ccCell", forIndexPath: indexPath) as! ccTableViewCell
        
        dCell.cLabel.text = self.clubs[indexPath.row] as String // ClubName
        dCell.cAddress.text = self.clubAddress[indexPath.row]   // Address
        dCell.cType.text = self.clubType[indexPath.row]         // Type
        
        
        if clubPics.count > indexPath.row {
            
            dCell.cImage.image = clubPics[indexPath.row]
            
        }
       
        return dCell
    }
    

    // MARK: - Navigation

        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

                    var detailScene = segue.destinationViewController as! PromotersVC

                    if let indexPath = self.tableView.indexPathForSelectedRow(){

                        let row = Int(indexPath.row)

                        detailScene.currentObject = (clubObjects[row] as PFObject)

            }

    }

}
