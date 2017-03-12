//
//  StarredVC+GistUnstar.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 3/1/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit

extension StarredVC: GistStarDelegate {
    
    // Required function to conform to protocol
    func updateStar(gist: Gist, currentStarStatus: Star) {
        // Removing the gist from the Starred array
        findElement(gistID: gist.id)
        // Refreshes the table view
        self.tableView.reloadData()
    }
    
    // Method to remove the gist when unstarred
    func findElement(gistID: String) {
        var index = 0
        for item in starredGistList {
            index += 1
            if item.id == gistID {
                starredGistList.remove(at: index)
            }
        }
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
            // Remove the star
            
            // Change the the title of the button to unstarred
            return .noStar
        }
    }

    
}
