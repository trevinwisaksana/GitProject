//
//  MeVC+TableView.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 2/19/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit

extension UserVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersListOfGist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GistCell") as! GistTableViewCell
        
        let itemFromIndexPath = usersListOfGist[indexPath.row]
        
        // Updates the description
        cell.descriptionTextView.text = itemFromIndexPath.description
        // Updates the filename
        cell.filenameLabel.text = itemFromIndexPath.filename
        // Updates the username label
        cell.usernameLabel.text = itemFromIndexPath.user
        
        // Assigning the GistStarDelegate protocol to the PublicVC
        cell.delegate = self
        
        // Assigning the gist value in the cell to the value in the listOfPublicGists
        cell.gist = itemFromIndexPath
        
        // Changing the star button title depending on whether its starred
        cell.starButtonOutlet.setTitle(itemFromIndexPath.star.rawValue, for: .normal)
        
        // Only downloads the image based on whether the cell is visible or not
        URLSession.shared.dataTask(with: itemFromIndexPath.profileImageURL) { (data, response, error) in
            // Checks if the data is nil
            guard let data = data else {
                return
            }
            
            let workItem = DispatchWorkItem {
                // Creates the image from the data
                let profileImage = UIImage(data: data)
                // Must update the UI on the main thread
                DispatchQueue.main.async {
                    // Assigns the profile image to the one on the cell
                    cell.profileImage.image = profileImage
                }
            }
            
            // Asynchronously sets the image
            DispatchQueue.global().async(execute: workItem)
            
            // Don't need to refresh the table view
            // cell as it is already updated in the main queue
            
        }.resume()

        
        return cell
        
    }
}
