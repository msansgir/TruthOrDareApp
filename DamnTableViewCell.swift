//
//  DamnTableViewCell.swift
//  AzureMLApp
//
//  Created by Mallika Sansgiri on 3/24/20.
//  Copyright © 2020 Mallika Sansgiri. All rights reserved.
//

import UIKit

class DamnTableViewCell: UITableViewCell {

    
    @IBOutlet weak var damn: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
