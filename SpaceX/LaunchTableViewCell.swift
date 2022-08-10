//
//  LaunchTableViewCell.swift
//  SpaceX
//
//  Created by Rodrigo Lara on 09/08/22.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var launcheImage: UIImageView!
    @IBOutlet weak var missionName: UILabel!
    @IBOutlet weak var missionDesc: UILabel!
    @IBOutlet weak var missionDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
