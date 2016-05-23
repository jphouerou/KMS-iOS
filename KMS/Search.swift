//
//  Search.swift
//  KMS
//
//  Created by John Le Houerou on 05/05/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet var mySearchBar: UISearchBar!
    @IBOutlet var myTablView: UITableView!
    
    var searchResults = [String]()
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let url = NSURL (string: "https://m.facebook.com/");
        //let requestObj = NSURLRequest(URL: url!);
        //webview.loadRequest(requestObj);
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return searchResults.count
    }
    
   
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var myCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! UITableViewCell
        
        return myCell
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        print("Seaching...")
    }
    
}

