//
//  homeModel.swift
//  KMS
//
//  Created by John Le Houerou on 07/06/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import Foundation
protocol homeModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}


class homeModel: NSObject, NSURLSessionDataDelegate {
    
    //properties
    
    weak var delegate: homeModelProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    // Laan van de Bork:    192.168.2.7.
    // Hunenbaan:           192.168.1.17
    let urlPath: String = "http://192.168.2.7/PHP/home.php"
    
    func downloadItems()
    {
        let url: NSURL = NSURL(string: urlPath)!
        var session: NSURLSession!
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTaskWithURL(url)
        
        task.resume()
        
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData)
    {
        self.data.appendData(data);
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?)
    {
        if error != nil
        {
            print("Failed to download data")
        }
        else
        {
            print("Data downloaded")
            self.parseJSON()
        }
        
    }
    
    func parseJSON() {
        
        print("Parsing JSON...")
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        do{
            jsonResult = try NSJSONSerialization.JSONObjectWithData(self.data, options:NSJSONReadingOptions.AllowFragments) as! NSMutableArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let locations: NSMutableArray = NSMutableArray()
        
        for(var i = 0; i < jsonResult.count; i++)
        {
            print("JsonResult count")
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = dataModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            //if let postID = jsonElement["postID"] as? Int,
            if let postTitle = jsonElement["postTitle"] as? String,
                let postCategory = jsonElement["postCategory"] as? String
                //let postID = jsonElement["postID"] as? Int
            {
                
                //location.postID = postID
                location.postTitle = postTitle
                location.postCategory = postCategory
                //location.postID = postID
            }
            
            locations.addObject(location)
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.delegate.itemsDownloaded(locations)
            
        })
    }
}