//
//  ccTableViewCell.swift
//  PartyApp
//
//  Created by Karthik on 10/09/2015.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class ccTableViewCell: UITableViewCell {

    @IBOutlet var cImage: UIImageView!
    
    @IBOutlet var cLabel: UILabel!
    
    @IBOutlet var cEventName: UILabel!
    
    @IBOutlet var cAddress: UILabel!
    
    @IBOutlet var cType: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
