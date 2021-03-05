//
//  NewsCellTableView.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 05.03.2021.
//

import UIKit

class NewsCellTableView: UITableViewCell {
    
    static let reuseIdentifier = "NewsCellTableView"

    
    @IBOutlet var logo: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var post: UILabel!
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var likeView: LikeView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
