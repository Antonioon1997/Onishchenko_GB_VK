//
//  FullscreenViewController.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 14.03.2021.
//

import UIKit

class FullscreenViewController: UIViewController {
    
    var photos = [UIImage] ()
    var indexPath: IndexPath!
    var numberOfIndexPath: Int!
    
    
    @IBOutlet var currentPhoto: UIImageView!
    @IBOutlet var nextPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPhoto.image = photos[numberOfIndexPath]
        
        
    }
    
    @IBAction func previousPhotoSwipe(_ sender: UISwipeGestureRecognizer) {
        print ("Did")
        guard numberOfIndexPath > 0 else {  return }
        //        let newPhotoIndex = numberOfIndexPath - 1
        //        let newPhoto = photos[newPhotoIndex]
        //        nextPhoto.image = newPhoto
        //        nextPhoto.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
        //        UIView.animate(withDuration: 1) { [self]  in
        //            currentPhoto.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        //        } completion: { [self] _ in
        //
        //            currentPhoto.transform = .identity
        //            nextPhoto.transform = .identity
        //            currentPhoto.image = newPhoto
        //            numberOfIndexPath -= 1
        //        }
        let newPhotoIndex = numberOfIndexPath - 1
        let photo = photos[newPhotoIndex]
        nextPhoto.image = photo
        nextPhoto.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
        UIView.animate(withDuration: 0.75) { [self] in
            currentPhoto.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
            nextPhoto.transform = .identity
        } completion: { [self] _ in
            currentPhoto.image = photo
            currentPhoto.transform = .identity
            numberOfIndexPath -= 1
            
        }
        
    }
    
    @IBAction func nextPhotoSwipe(_ sender: UISwipeGestureRecognizer) {
        guard numberOfIndexPath < photos.count - 1 else {  return }
        let newPhotoIndex = numberOfIndexPath + 1
        let photo = photos[newPhotoIndex]
        nextPhoto.image = photo
        nextPhoto.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        UIView.animate(withDuration: 0.75) { [self] in
            currentPhoto.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
            nextPhoto.transform = .identity
        } completion: { [self] _ in
            currentPhoto.image = photo
            currentPhoto.transform = .identity
            numberOfIndexPath += 1
        }
    }
    
    
    
    
}
