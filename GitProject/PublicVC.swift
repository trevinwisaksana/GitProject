//
//  PublicVC.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 2/17/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit
import Alamofire

class PublicVC: UIViewController {
    
    @IBOutlet weak var publicGistTableView: UITableView!
    
    // Stores the gist descriptions
    var listOfPublicGists: [Gist] = []
    
    // MARK: - App Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Retrieving the gists
        GistService.getGistsWith(url: Router.publicGists) { (publicGists) in
            // NOTE: This can only run in the main thread
            self.listOfPublicGists = publicGists
            // Refreshes the table view
            self.publicGistTableView.reloadData()
        }
        
    }
    
}
