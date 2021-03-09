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
        let gesture = UITapGestureRecognizer(target: self, action: #selector(animateAvatar(_:)))
        self.addGestureRecognizer(gesture)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func animateAvatar (_ gesture: UITapGestureRecognizer){
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [.curveEaseInOut]) { [self] in
            groupAvatar.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//            groupAvatar.transform = CGAffineTransform(rotationAngle: 1000)
            
        } completion: { _ in
            //            self.groupAvatar.transform = CGAffineTransform(scaleX: 2, y: 2)
            //            self.groupAvatar.transform = .identity
        }
        UIView.animate(withDuration: 1, delay: 0.8, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [.curveEaseInOut]) { [self] in
            groupAvatar.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            print ("tapped")
            
        }
    }
    
}
