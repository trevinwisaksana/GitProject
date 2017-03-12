//
//  MeVC.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 2/17/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit
import Alamofire

class UserVC: UIViewController {
    
    @IBOutlet weak var myGistTableView: UITableView!
    
    var usersListOfGist: [Gist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GistService.getGistsWith(url: Router.userGists("trevinwisaksana")) { (userGists) in
            // Assigning the result of the network request to the myListOfGists
            self.usersListOfGist = userGists
            // Refreshes the table view
            self.myGistTableView.reloadData()
        }
        
    }
    
}
