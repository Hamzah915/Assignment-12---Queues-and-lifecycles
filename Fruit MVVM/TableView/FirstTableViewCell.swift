//
//  FirstTableViewCell.swift
//  Fruit MVVM
//
//  Created by Hamzah Azam on 13/04/2023.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
