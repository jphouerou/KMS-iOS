//
//  SearchController.swift
//  KMS
//
//  Created by John Le Houerou on 01/06/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import Foundation
import UIKit

class SearchController: UIViewController, UITableViewDataSource, UITableViewDelegate, postModelProtocal {

    //@IBOutlet weak var listTableView: UITableView!
    
    //Properties
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : dataModel = dataModel()
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        print("View Loaded")

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
        // Return the number of feed items
        print(feedItems.count)
        return feedItems.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("Table View")
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        // Get the location to be shown
        let item: dataModel = feedItems[indexPath.row] as! dataModel
        // Get references to labels of cell
        myCell.textLabel!.text = item.postTitle
        //myCell.textLabel!.text = item.postCategory
        //myCell.textLabel!.text = "Hello world"
        print(item.postTitle)
        
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
