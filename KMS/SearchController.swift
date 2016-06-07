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
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        if(searchBar.text!.isEmpty)
        {
        print ("empty searchbar")
        /* searchBar.resignFirstResponder()
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let PostModel = postModel()
        PostModel.delegate = self
        PostModel.downloadItems() */
        return
        }
            doSearch(searchBar.text!)
        /* else
        {
            print ("Searching...")
            searchBar.resignFirstResponder()
            self.listTableView.delegate = self
            self.listTableView.dataSource = self
            
            let PostModel = postModel()
            PostModel.delegate = self
            PostModel.downloadItems()
        } */
        //return true
    }
    
    func doSearch(searchWord: String)
    {
        print ("Searching...")
        searchBar.resignFirstResponder()
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let PostModel = postModel()
        PostModel.delegate = self
        PostModel.downloadItems()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "cubes.jpg")!)
        
        //set delegates and initialize postModel

        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let PostModel = postModel()
        PostModel.delegate = self
        PostModel.downloadItems()
        
    }
    
    func itemsDownloaded(items: NSArray) {
        print("Items downloaded")
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        if (item.postCategory == "Graphic Design")
        {
        let imageName = "Design icon.png"
        let image = UIImage(named: imageName)
        myCell.imageView?.image = image
        }
        if (item.postCategory == "IT")
        {
            let imageName = "IT icon.png"
            let image = UIImage(named: imageName)
            myCell.imageView?.image = image
        }
        if (item.postCategory == "Administration")
        {
            let imageName = "Administration icon.png"
            let image = UIImage(named: imageName)
            myCell.imageView?.image = image
        }
        if (item.postCategory == "Marketing")
        {
            let imageName = "Marketing icon.png"
            let image = UIImage(named: imageName)
            myCell.imageView?.image = image
        }
        
        return myCell
    }
    
    /*
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "cubes.jpg")!)
        // Do any additional setup after loading the view, typically from a nib.
    } */
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
