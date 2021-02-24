//
//  FriendPhotosCell.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 18.02.2021.
//

import UIKit

class FriendPhotosCell: UICollectionViewCell {
    @IBOutlet var friendPhoto: UIImageView!
    @IBOutlet var likeView: LikeView!
    var isLiked: Bool = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeView.addTarget(self, action: #selector(likeTyped), for: .touchUpInside)
        likeView.likeCountLabel.text = "\(likeView.likeCount)"
        likeView.likeImage.image = UIImage(named: "like.false.2")
        
    }
    
    @objc private func likeTyped() {
        isLiked.toggle()
        
        if isLiked {
        likeView.likeCount += 1
        likeView.likeCountLabel.text = "\(likeView.likeCount)"
            likeView.likeImage.image = UIImage(named: "like.true.1")
        }
        else{
//            likeView.likeCount -= 1
//            likeView.likeImage.image = UIImage(named: "like.false")
            likeView.likeImage.image = UIImage(named: "like.false.2")
            likeView.likeCount -= 1
            likeView.likeCountLabel.text = "\(likeView.likeCount)"
    
        }
    }
}
