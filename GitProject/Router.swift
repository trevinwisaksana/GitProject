//
//  NetworkService.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 2/17/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit
import Alamofire

public enum Router: URLRequestConvertible {
    
    static let baseURL: String = "https://api.github.com"
    
    // Different states of the Router
    case userGists(String)
    case star(String)
    case publicGists
    case unstar(String)
    case getStarredGists
    case createGist([String : Any])
    
    var method: HTTPMethod {
        switch self {
        case .userGists, .publicGists, .getStarredGists:
            return .get
        case .star:
            return .put
        case .unstar:
            return .delete
        case .createGist:
            return .post
        }
    }

    var path: String {
        switch self {
        case .userGists(let username):
            return "/users/\(username)/gists"
        case .star(let id):
            return "/gists/\(id)/star"
        case .unstar(let id):
            return "/gists/\(id)/unstar"
        case .publicGists:
            return "/gists/public"
        case .getStarredGists:
            return "/gists/starred"
        case .createGist:
            return "/gists"
        }
    }
    
    
    public func asURLRequest() throws -> URLRequest {
        
        // Set the URL-parameters
        let parameters: [String: Any] = {
            switch self {
            case .userGists:
                
                // Using the formatter to change its format
                let formatter = ISO8601DateFormatter()
                // Getting the date formatter
                guard let date = formatter.date(from: "2015-03-01T18:49:24Z") else {
                    return ["since": Date()]
                }
            
                return ["since" : date]
                
            case .star, .publicGists, .unstar, .getStarredGists:
                return [:]
            case .createGist(let json):
                return json
            }
        }()
        
    
        // Sets the header for the request
        // TODO: Exhaust all the cases
        let headers: [String : String] = {
            switch self {
            case .star, .unstar:
                return ["Content-Length" : "0"]
            case .userGists, .getStarredGists:
                return [:]
            default:
                return [:]
            }
        }()
        
        // Sets as a URL
        let url = try Router.baseURL.asURL()
        
        // Creating a request
        var request = URLRequest(url: url.appendingPathComponent(path))
        // Mutates the request to change the HTTPRequest method
        request.httpMethod = method.rawValue
        
        // Adds the headers to the request
        headers.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }

        // Sends the request
        switch self {
        case .createGist:
            return try JSONEncoding.default.encode(request, with: parameters)
        default:
            return try URLEncoding.default.encode(request, with: parameters)
        }
        
    }
     
}



