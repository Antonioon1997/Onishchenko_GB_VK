//
//  AddGroupsCell.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 18.02.2021.
//

import UIKit

class AddGroupsCell: UITableViewCell {
//    @IBOutlet var addGroupAvatar: UIImageView!
    
    @IBOutlet var addGroupAvatar: AvatarView!
    @IBOutlet var addGroupName: UILabel!
    @IBOutlet var addGroupInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 0/0, green: 0/0, blue: 0/0, alpha: 0.2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
