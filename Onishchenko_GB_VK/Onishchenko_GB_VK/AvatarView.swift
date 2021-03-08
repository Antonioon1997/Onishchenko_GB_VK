//
//  AvatarView.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 23.02.2021.
//

import UIKit

class AvatarView: UIView {
    
    @IBOutlet var shadowView: UIView!
    @IBOutlet var avatarImageView: UIImageView!
    @IBInspectable var shadowColor: CGColor = UIColor.red.cgColor
    @IBInspectable var shadowRadius: CGFloat = 33
    @IBInspectable var shadowOpacity: Float = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        shadowView.clipsToBounds = false
         shadowView.layer.cornerRadius = shadowRadius
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.shadowColor = shadowColor
        shadowView.backgroundColor = .black
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
        addSubview(shadowView)
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 33
        addSubview(avatarImageView)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
