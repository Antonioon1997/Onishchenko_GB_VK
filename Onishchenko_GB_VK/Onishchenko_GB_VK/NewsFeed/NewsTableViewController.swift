//
//  NewsTableViewController.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 04.03.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    private var newsData: [NewsData] = [
        NewsData(newsLogo: UIImage(named: "pug"), newsName: "Your mom", newsTime: "long long ago", newsPost: "I'll fock your family,bro", newsImages: [UIImage(named: "pug"), UIImage(named: "pug")]),
        NewsData(newsLogo: UIImage(named: "pug"), newsName: "Your mom", newsTime: "long long ago", newsPost: "I'll fock your family,bro", newsImages: [UIImage(named: "rikardo1"), UIImage(named: "rikardo1"), UIImage(named: "rikardo1")]),
        NewsData(newsLogo: UIImage(named: "bonk1"), newsName: "Bonk", newsTime: "recently", newsPost: "Go to the horny jail!", newsImages: [UIImage(named: "bonk2")])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewsCellTableView", bundle: nil), forCellReuseIdentifier: "NewsCellTableView")
        
        self.tableView.backgroundColor = UIColor(red: 0/255, green: 14/255, blue: 36/255, alpha: 1)
        tabBarController?.tabBar.tintColor = UIColor.black
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsData.count
        
    }

    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellTableView", for: indexPath) as! NewsCellTableView
        
        let postImages = [cell.postImage1, cell.postImage2, cell.postImage3, cell.postImage4]
        postImages.forEach({$0?.isHidden = true})

        let cellData = newsData[indexPath.row]
        
        cell.logo.image = cellData.newsLogo
        cell.name.text = cellData.newsName
        cell.time.text = cellData.newsTime
        cell.post.text = cellData.newsPost
        for i in 0..<cellData.newsImages.count{
            do {
            postImages[i]?.isHidden = false
            postImages[i]?.image = cellData.newsImages[i]
            }
            while cellData.newsImages.count <= 4 {
                
                break
            }
            
        }
//        postImages[indexPath.row]?.image = cellData.newsImages[indexPath.row]
       
        
        
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
