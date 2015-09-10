//
//  PromoterTableCell.swift
//  ParseStarterProject
//
//  Created by Karthik on 09/09/2015.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class PromoterTableCell: UITableViewCell {

//    @IBOutlet var promoterImage: UIImageView!
//    
//    @IBOutlet var promoterNameLabel: UILabel!
  
    @IBOutlet var promoterImage: UIImageView!
    
    @IBOutlet var promoterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        promoterImage.layer.masksToBounds = true
        promoterImage.layer.cornerRadius = self.promoterImage.frame.size.width / 2
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }


}
