//
//  CustomTableViewCell.swift
//  AzureMLApp
//
//  Created by Mallika Sansgiri on 3/22/20.
//  Copyright © 2020 Mallika Sansgiri. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var textLab: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
