//
//  Search.swift
//  KMS
//
//  Created by John Le Houerou on 05/05/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import UIKit

class Search: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet var mySarchBar: UISearchBar!
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
        
        myCell.textLabel?.text = searchResults[indexPath.row]
        
        return myCell
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        print("Seaching...")
        
        if(searchBar.text == nil)
        {
            return
        }
        
        doSearch(searchBar.text!)
    }
    
    func doSearch(searchWord: String)
    {
     searchBar.resignFirstResponder()
        
        // Laan van de Bork: 192.168.2.7.
        // Hunenbaan: 192.168.1.17
        let request = NSMutableURLRequest(URL: NSURL(string: "http://192.168.2.7/PHP/search.php")!)
        request.HTTPMethod = "POST"
        let postString = "searchWord=\(searchWord)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            
            /*
            var err: NSError?
            try {var json = NSJSONSerialization.JSONObjectWithData((data?)!, options: .MutableLeaves) as? NSDictionary
            
            self.searchResults.removeAll(keepCapacity: false)
            self.myTablView.reloadData()
            
            if let parseJSON = json 
            {
                if let friends = parseJSON["friends"] as? [AnyObject]
                {
                    for friendObj in friends
                    {
                        var postTitle = (friendObj["postTile"] as! String)
                        self.searchResults.append(postTitle)
                    }
                    self.myTablView.reloadData()
                }
            }
            } */
            }
        task.resume();
    }
}