//
//  PostVC.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 3/8/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit
import Alamofire

class PostVC: UIViewController {
    
    @IBOutlet weak var gistTitleTextField: UITextField!
    
    @IBOutlet weak var gistDescriptionTextView: UITextView!
    
    @IBAction func createGistButton(_ sender: UIButton) {
        // Creating a JSON file format
        let json: [String : Any] = ["description" : gistDescriptionTextView.text,
                                    "public" : true,
                                    "files" :
                                        ["\(gistTitleTextField.text)" :
                                            ["content" : gistDescriptionTextView.text]]]
        // Sends a POST request with data
        GistService.post(data: json)
    }
    
}
