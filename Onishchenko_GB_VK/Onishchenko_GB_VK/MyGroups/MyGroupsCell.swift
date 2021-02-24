//
//  MyGroupsCell.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 18.02.2021.
//

import UIKit

class MyGroupsCell: UITableViewCell {
//
//    @IBOutlet var groupAvatar: AvatarView!
    
    @IBOutlet var groupAvatar: AvatarView!
    @IBOutlet var groupName: UILabel!
    @IBOutlet var groupInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 0/0, green: 0/0, blue: 0/0, alpha: 0.2)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
