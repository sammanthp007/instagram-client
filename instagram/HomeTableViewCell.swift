//
//  HomeTableViewCell.swift
//  instagram
//
//  Created by samman ios on 3/20/17.
//  Copyright © 2017 samman ios. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var workingImageView: PFImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
