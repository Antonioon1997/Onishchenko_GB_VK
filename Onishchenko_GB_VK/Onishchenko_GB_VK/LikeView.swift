//
//  LikeView.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 23.02.2021.
//

import UIKit

class LikeView: UIControl {
    @IBOutlet var likeImage: UIImageView!
    @IBOutlet var likeCountLabel: UILabel!
    var likeCount: Int = 0

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tapGestureDetected))
        self.addGestureRecognizer(tapGesture)
        self.backgroundColor = .clear
//        likeImage.backgroundColor = .clear
        
        
        
       
    }
    @objc func tapGestureDetected(_ gesture: UITapGestureRecognizer){
        sendActions(for: UIControl.Event.touchUpInside)
    }
}
