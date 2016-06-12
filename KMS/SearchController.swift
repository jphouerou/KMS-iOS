//
//  SearchController.swift
//  KMS
//
//  Created by John Le Houerou on 01/06/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import Foundation
import UIKit

class SearchController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, postModelProtocal {
    
    
    //Properties
    var feedItems: NSArray = NSArray()
    var selectedLocation : dataModel = dataModel()
    
    // UI
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    
    // If Search is pressed, run
    func searchBarSearchButtonClicked(mySearchBar: UISearchBar)
    {
        if(mySearchBar.text!.isEmpty)
        {
            print ("empty searchbar")
            /* searchBar.resignFirstResponder()
             self.listTableView.delegate = self
             self.listTableView.dataSource = self
        
             let PostModel = postModel()
             PostModel.delegate = self
             PostModel.downloadItems() */
            //return
        }
            //doSearch(searchBar.text!)
        else
        {
            print ("Searching...")
            mySearchBar.resignFirstResponder()
            self.listTableView.delegate = self
            self.listTableView.dataSource = self
            
            let PostModel = postModel()
            PostModel.delegate = self
            PostModel.downloadItems()
        }
        //return true
    }
    
    func doSearch(searchWord: String)
    {
        print ("Searching...")
        mySearchBar.resignFirstResponder()
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let PostModel = postModel()
        PostModel.delegate = self
        PostModel.downloadItems()

    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //set delegates and initialize postModel
        /*
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let PostModel = postModel()
        PostModel.delegate = self
        PostModel.downloadItems()
        */
        
    }
    
    func itemsDownloaded(items: NSArray)
    {
        print("Items downloaded")
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // Return number of feed items
        return feedItems.count
    }
    
    /* Storing postIDs
    let ids = [5, 10, 20]
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let id = ids[indexPath.row]
    }
     */
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            // Retrieve cell
            let cellIdentifier: String = "BasicCell"
            let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        
            // Get the post to be shown
            let item: dataModel = feedItems[indexPath.row] as! dataModel
        
            // Get references to labels of cell
            myCell.textLabel!.text = item.postTitle
            myCell.detailTextLabel!.text = item.postCategory
        
            // Marketing Category
            if (item.postCategory == "Graphic Design")
            {
                let imageName = "Design icon.png"
                let image = UIImage(named: imageName)
                myCell.imageView?.image = image
            }
            // IT Category
            if (item.postCategory == "IT")
            {
                let imageName = "IT icon.png"
                let image = UIImage(named: imageName)
                myCell.imageView?.image = image
            }
            // Administration Category
            if (item.postCategory == "Administration")
            {
                let imageName = "Administration icon.png"
                let image = UIImage(named: imageName)
                myCell.imageView?.image = image
            }
            // Marketing Category
            if (item.postCategory == "Marketing")
            {
                let imageName = "Marketing icon.png"
                let image = UIImage(named: imageName)
                myCell.imageView?.image = image
            }
        
        return myCell
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
