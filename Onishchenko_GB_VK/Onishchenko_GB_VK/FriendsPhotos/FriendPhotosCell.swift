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
//        appearPhoto()

    }
    
    
    
    @objc private func likeTyped() {
        isLiked.toggle()
        
        if isLiked {
            UIView.transition(with: likeView, duration: 0.5, options: [.transitionFlipFromBottom]) {
                [self] in
                    likeView.likeImage.image = UIImage(named: "like.true.1")
                likeView.likeCount += 1
                likeView.likeCountLabel.text = "\(likeView.likeCount)"
            } completion: { _ in }
        }
        else{
            UIView.transition(with: likeView, duration: 1, options: [.transitionFlipFromTop]) {
                [self] in
                likeView.likeImage.image = UIImage(named: "like.false.2")
                likeView.likeCount -= 1
                likeView.likeCountLabel.text = "\(likeView.likeCount)"
            } completion: { _ in }

        }
    }
    
//    func appearPhoto() {
//        let animation = CASpringAnimation(keyPath: "transform.scale")
//        animation.fromValue = 0
//            animation.toValue = 1
//            animation.stiffness = 100
//            animation.mass = 2
//            animation.duration = 2
//            animation.beginTime = CACurrentMediaTime()
//            animation.fillMode = CAMediaTimingFillMode.backwards
//
//            self.friendPhoto.layer.add(animation, forKey: nil)
//    }
}
