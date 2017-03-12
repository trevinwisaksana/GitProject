//
//  GistHeadersAdapter.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 3/6/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit
import Alamofire

class GistHeadersAdapter: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        
        // Has to be assigned to a variable because urlRequest cannot be mutated
        var request = urlRequest
        
        let username = "trevinwisaksana"
        let authToken = "43f6ab591df42d53a875f335ec350d0fcd9cd469"
        
        // Alamofire returns a tuple of key and value
        if let authorizationHeader = Request.authorizationHeader(user: username, password: authToken) {
            request.setValue(authorizationHeader.value, forHTTPHeaderField: authorizationHeader.key)
        }
        
        return request
        
    }
    
}
