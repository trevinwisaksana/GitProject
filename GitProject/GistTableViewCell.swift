//
//  MeTableViewCell.swift
//  GitProject
//
//  Created by Trevin Wisaksana on 2/19/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit

protocol GistStarDelegate: class {
    func updateStar(gist: Gist, currentStarStatus: Star)
    func updateIcon(status: Star, id: String) -> Star
}


class GistTableViewCell: UITableViewCell {
    
    weak var delegate: GistStarDelegate!
    
    var gist: Gist!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var filenameLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var starButtonOutlet: UIButton!
    
    
    @IBAction func starButtonAction(_ sender: UIButton) {
        let updatedStar = delegate.updateIcon(status: gist.star, id: gist.id)
        delegate.updateStar(gist: gist, currentStarStatus: updatedStar)
    }
    
    override func prepareForReuse() {
        // Assuring there are no repeated items
        descriptionTextView.text = nil
        filenameLabel.text = nil
        usernameLabel.text = nil
    }
    
}
