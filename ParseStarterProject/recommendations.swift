//
//  recommendations.swift
//  ParseStarterProject
//
//  Created by Karthik on 09/09/2015.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation

import Foundation

struct Recommendations {
    
    let id: String
    let user: PFUser
}

func fetchRecommendations(user: PFUser)->[PFUser]{
    
    var users = [PFUser]()
    return users
    
}
func saveRecommend(user: PFUser) {
    
    let recommend = PFObject(className: "recommendations")
    recommend.setObject(PFUser.currentUser()!, forKey: "byUser")
    recommend.setObject(user, forKey: "toPromoter")
    recommend.setObject(PFUser.currentUser()!.username!, forKey: "byUsername")
    recommend["type"] = "recommended"
    recommend.saveInBackgroundWithBlock(nil)
}
