//
//  SearchTableViewCell.swift
//  iTravel
//
//  Created by Paul Junver Soriano on 5/6/21.
//  Copyright © 2021 shijiah2012@gmail.com. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
