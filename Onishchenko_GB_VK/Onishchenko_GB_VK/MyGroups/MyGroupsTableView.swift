//
//  MyGroupsTableView.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 18.02.2021.
//

import UIKit

class MyGroupsTableView: UITableViewController {
    
    var myGroupsInfo = [Groups(groupName: "MetalFlowers", groupAvatar: UIImage(named: "pug"), groupInfo: "Here we talking about the flowers. Boring")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(red: 0/255, green: 14/255, blue: 36/255, alpha: 1)
        navigationController?.navigationBar.backgroundColor = UIColor.gray
        tabBarController?.tabBar.backgroundColor = UIColor.gray
        tabBarController?.tabBar.unselectedItemTintColor = UIColor(red: 0/0, green: 0/0, blue: 0/0, alpha: 1)
        tabBarController?.tabBar.tintColor = UIColor.black
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myGroupsInfo.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsCell", for: indexPath) as! MyGroupsCell

        cell.groupAvatar.avatarImageView.image = myGroupsInfo[indexPath.row].groupAvatar
        cell.groupName.text = myGroupsInfo[indexPath.row].groupName
        cell.groupInfo.text = myGroupsInfo[indexPath.row].groupInfo
        
        return cell
    }
    
    //MARK: - Func to append new groups to list
    @IBAction func addGroup(segue:UIStoryboardSegue) {
        if let addGroupsTableView = segue.source as? AddGroupsTableView ,
           let selectedIndexPath = addGroupsTableView.tableView.indexPathForSelectedRow {
            let selectedGroup = addGroupsTableView.groups[selectedIndexPath.row]
            if !myGroupsInfo.contains(selectedGroup){
                myGroupsInfo.append(selectedGroup)
                tableView.reloadData()
                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Func to remove groups from list
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroupsInfo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
}
