//
//  UserVC+GistStar.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 3/1/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit

extension UserVC: GistStarDelegate {
    
    // Required function to conform to protocol
    func updateStar(gist: Gist, currentStarStatus: Star) {
        // Gist Star is updated
        // Note if "gist" is a struct, it wouldn't allow it to be modified because it is passed by value not reference unlike a class
        gist.star = currentStarStatus
        // Refreshes the table view
        self.myGistTableView.reloadData()
    }
    
    // Required function to conform to protoco
    func updateIcon(status: Star, id: String) -> Star {
        switch status {
        // Gist is not starred
        case .noStar:
            // Sends a request to star a gist
            GistService.starGist(id: id)
            // Changes the title of the button to starred
            return .star
            
        case .star:
            // Sends a request to unstar a gist
            GistService.unstarGist(id: id)
            // Change the the title of the button to unstarred
            return .noStar
        }
    }

    
}
