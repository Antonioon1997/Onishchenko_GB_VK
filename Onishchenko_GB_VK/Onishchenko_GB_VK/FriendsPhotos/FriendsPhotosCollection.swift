//
//  FriendsPhotosCollection.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 18.02.2021.
//

import UIKit

class FriendsPhotosCollection: UICollectionViewController {
    
    
    var currentFriend: FriendsData?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = UIColor(red: 0/255, green: 14/255, blue: 36/255, alpha: 1)
        title = currentFriend?.name
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 1) {
            self.view.alpha = 0
        }
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return currentFriend?.photosInAlbum.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotosCollectionCell", for: indexPath) as! FriendPhotosCell
        
        cell.friendPhoto.image = currentFriend?.photosInAlbum[indexPath.row]
        cell.alpha = 0
        UIView.animate(withDuration: 1) {
            cell.alpha = 1
        }
        
        return cell
    }
}
