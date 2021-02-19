//
//  FriendsCell.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 17.02.2021.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    @IBOutlet var friendName: UILabel!
    @IBOutlet var friendMessage: UILabel!
    @IBOutlet var friendPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor(red: 0/0, green: 0/0, blue: 0/0, alpha: 0.2)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
