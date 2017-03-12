//
//  ViewController.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 2/17/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit
import Alamofire

class StarredVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var starredGistList: [Gist] = []
    
    var profileImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Creating a network request to retrieve the starred gists
        GistService.getGistsWith(url: Router.getStarredGists) { (starredGists) in
            // Assigning the result of the flatmap to the starredGistList
            self.starredGistList = starredGists
            // Refreshing hte table view
            self.tableView.reloadData()
        }
    }

}

