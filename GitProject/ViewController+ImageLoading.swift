//
//  ViewController+ImageLoading.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 2/27/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func retrieveImage(URL: String) {
        // Only downloads the image based on whether the cell is visible or not
        /*
        URLSession.shared.dataTask(with: URL) { (data, response, error) in
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
        */
    }
    
}
