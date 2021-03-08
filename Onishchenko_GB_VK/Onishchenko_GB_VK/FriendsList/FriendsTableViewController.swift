//
//  FriendsTableViewController.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 14.02.2021.
//

import UIKit
import Foundation


class FriendsTableViewController: UITableViewController {
    
    //MARK: Need this struct for sorting friends to sections by first letter
    struct FriendsSections {
        var firstLetter: String
        var friend: [FriendsData]
    }
    
    var friendsData = [
        FriendsData(name: "Ricardo Milos", message: "Добрый день, братья славяне", photo: UIImage(named: "Ricardo Milos"), photosInAlbum: [UIImage(named: "rikardo1"), UIImage(named: "rikardo2"), UIImage(named: "rikardo3")]),
        FriendsData(name: "Doggy", message: "Bonk!", photo: UIImage(named: "bonk"), photosInAlbum: [UIImage(named: "bonk1"), UIImage(named: "bonk2"), UIImage(named: "bonk3")]),
        FriendsData(name: "Joke", message: "A'm I some kind of joke to you?", photo: UIImage(named: "Joke"), photosInAlbum: [UIImage(named: "joke1"), UIImage(named: "joke2"), UIImage(named: "joke3")]),
        FriendsData(name: "Pug", message: "Zzz Zzz Zzz", photo: UIImage(named: "sleeping pug"), photosInAlbum: [UIImage(named: "pug1"), UIImage(named: "pug2"), UIImage(named: "pug3")]),
        FriendsData(name: "Man", message: "Why are you gay?", photo: UIImage(named: "why are you gae"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")]),
        FriendsData(name: "Manuil", message: "Who om I?", photo: UIImage(named: "like.true"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")]),
        FriendsData(name: "Manuil", message: "Who om I?", photo: UIImage(named: "like.true"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")]),
        FriendsData(name: "Manuil", message: "Who om I?", photo: UIImage(named: "like.true"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")]),
        FriendsData(name: "Manuil", message: "Who om I?", photo: UIImage(named: "like.true"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")]),
        FriendsData(name: "Manuil", message: "Who om I?", photo: UIImage(named: "like.true"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")]),
        FriendsData(name: "Manuil", message: "Who om I?", photo: UIImage(named: "like.true"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")]),
        FriendsData(name: "Manuil", message: "Who om I?", photo: UIImage(named: "like.true"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")]),
        FriendsData(name: "Manuil", message: "Who om I?", photo: UIImage(named: "like.true"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")])
    ].sorted(by: {$0.name < $1.name})
    
    var sections = [FriendsSections]()
    
    var friendsByCharacters = [FriendsSections] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(red: 0/255, green: 14/255, blue: 36/255, alpha: 1)
        navigationController?.navigationBar.backgroundColor = UIColor.gray
        
        friendsSortedSections()
    }
    
    //MARK: - Set the letters to header of section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "\(firstLettersInArrow()[section])"
    }
    
    //MARK: - Size of header height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 15
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderCell
        cell.headerLabel.textColor = .white
        cell.headerLabel.text = firstLettersInArrow()[section]
        cell.backgroundColor = UIColor(red: 0/255, green: 14/255, blue: 72/255, alpha: 1)
        
        return cell
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
// 'couse of number of elements in array (amma mista logic)
        return friendsByCharacters.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
// 'couse of number of friends in section by alphabetic
        return friendsByCharacters[section].friend.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as! FriendsCell
        let friend = friendsByCharacters[indexPath.section].friend
        
        cell.friendName.text = friend[indexPath.row].name
        cell.friendPhoto.avatarImageView.image = friend[indexPath.row].photo
        cell.friendMessage.text = friend[indexPath.row].message
        
        return cell
    }
    
    //MARK: - Selected row stayed selected without this, looks bad
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK: - prepare segue to go to selected cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotos",
           let senderCell = sender as? FriendsCell,
           let friendCellIndexPath = tableView.indexPath(for: senderCell),
           let friendsPhotosCollectionController = segue.destination as? FriendsPhotosCollection {
            let selectedFriend = friendsData[friendCellIndexPath.row]
            friendsPhotosCollectionController.currentFriend = selectedFriend
        }
    }
    
    // MARK: - Getting first letters from names for section header
    func firstLettersInArrow () -> [String] {
        let firstLettersInArrow = friendsData.map {$0.name.first!}
        let uniqueLettersInArrow = Set(Array(firstLettersInArrow))
        var stringUniqueLettersInArrow = [String] ()
        for letters in uniqueLettersInArrow{
            stringUniqueLettersInArrow.append(String(letters))
        }
        return stringUniqueLettersInArrow.sorted(by: <)
    }
    
    //MARK: - Sort friends by alphabetic
    func friendsSortedSections () {
        
        let groupedFriends = Dictionary.init(grouping: friendsData) {String($0.name.prefix(1))}
        friendsByCharacters = groupedFriends.map { FriendsSections(firstLetter: String($0.key), friend: $0.value)}
        friendsByCharacters.sort { $0.firstLetter < $1.firstLetter}
        self.tableView.reloadData()
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsByCharacters.map {$0.firstLetter}
    }
}
