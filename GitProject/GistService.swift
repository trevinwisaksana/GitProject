//
//  GistService.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 2/18/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit
import Alamofire

class GistService {
    
    static let sessionManager = Alamofire.SessionManager.default
    
    static func getGistsWith(url: URLRequestConvertible, completionHandler: (([Gist]) -> Void)?) {
        
        sessionManager.adapter = GistHeadersAdapter()
        
        sessionManager.request(url).responseJSON { (response) in
            // Checks if the response receives a success message
            switch response.result {
            case .success(let json):
                // Checks if the response value is nil
                
                /*
                 Flat Map makes 3D arrays into a 2D array. Flat Map also automatically filters nil values which is useful to prevent creating incomplete objects.
                 */
                let gists = (json as! [[String : Any]]).flatMap(Gist.init)
                completionHandler?(gists)
                
            case .failure:
                break
            }
            
        }
        
    }
    
    /// Method to post a gist
    static func post(data: [String : Any]) {
        
        sessionManager.adapter = GistHeadersAdapter()
        
        sessionManager.request(Router.createGist(data)).responseJSON { (response) in
            return
        }
        
    }
    
    
    /// Method to star a gist
    static func starGist(id: String) {
        
        sessionManager.adapter = GistHeadersAdapter()
        
        sessionManager.request(Router.star(id)).responseJSON { (response) in
            return
        }
        
    }
    
    /// Method to unstar a gist
    static func unstarGist(id: String) {
        
        sessionManager.adapter = GistHeadersAdapter()
        
        sessionManager.request(Router.unstar(id)).responseJSON { (response) in
            return
        }
        
    }
}
