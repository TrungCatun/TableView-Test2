//
//  TableViewController.swift
//  TableView-Test2
//
//  Created by Trung on 6/22/18.
//  Copyright © 2018 TrungCatun. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var arrayData = ["oanh", "van", "lan anh", "minh phuong", "tuyen", "thao"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        
        cell.textLabel?.text = arrayData[indexPath.row]  // in ra du lieu vao tung cell
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController{
            if let index = tableView.indexPathForSelectedRow {    // indexPathForSelectedRow  chuyen du lieu khi click
                detailViewController.data = arrayData[index.row]
            }
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let detailViewController = unwindSegue.source as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow{
                arrayData[index.row]  = detailViewController.data!
                tableView.reloadRows(at: [index], with: .automatic)
            }
        }
//        tableView.reloadData()
    }
    
}
