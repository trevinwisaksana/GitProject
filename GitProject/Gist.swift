//
//  Gist.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 2/18/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit
import Alamofire

public class Gist {

    var user: String!
    var description: String!
    var id: String!
    var filename: String!
    var profileImageURL: URL!
    var star: Star = .noStar
    var isPublic: Bool!
    
    // Uses a failable initializer
    init?(dict: [String : Any]) {
        
        // Assures that all the data exists using the guard statement
        guard let description = dict["description"] as? String,
            let owner = dict["owner"] as? [String : Any],
            let username = owner["login"] as? String,
            let files = dict["files"] as? [String : Any],
            let id = dict["id"] as? String else {
            return nil
        }
        
        // Accessing the profile picture
        guard let profilePictureAddress = owner["avatar_url"] as? String else {
            return nil
        }
        
        guard let profileImageURL = URL(string: profilePictureAddress) else {
            return nil
        }
        
        // Accessing the fileHeader to access the filename
        guard let fileHeader = files.values.first as? [String : Any], let filename = fileHeader["filename"] as? String else {
            return nil
        }
        
        // Assigning all the values received to the data model
        self.description = description
        self.user = username
        self.id = id
        self.filename = filename
        self.profileImageURL = profileImageURL
        
    }
    
    init(post: [String : Any]) {
        // Assures that all the data exists using the guard statement
        guard let description = post["description"] as? String, let files = post["files"] as? [String : Any] else {
                return
        }
        
        // Accessing the fileHeader to access the filename
        guard let fileHeader = files.values.first as? [String : Any], let filename = fileHeader["filename"] as? String else {
            return 
        }
        
        self.description = description
        self.filename = filename
        self.isPublic = true
    }

}
