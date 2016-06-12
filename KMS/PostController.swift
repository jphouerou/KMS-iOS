//
//  PostController.swift
//  KMS
//
//  Created by John Le Houerou on 05/06/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import Foundation
import UIKit

class PostController: UIViewController, postDetailModelProtocal {
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet var postDescription: UILabel!
    
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : postDetailDataModel = postDetailDataModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "cubes.jpg")!)
        
        //set delegates and initialize postModel
        
        let PostDetailModel = postDetailModel()
        PostDetailModel.delegate = self
        PostDetailModel.downloadItems()
        
        //itemsDownloaded(NSArray)
        //tableView(<#T##indexPath: NSIndexPath##NSIndexPath#>)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsDownloaded(items: NSArray)
    {
        feedItems = items
        
        //let item: postDetailDataModel = feedItems[1] as! postDetailDataModel
        
        postTitle.text = "Hello, this is a test post title"
        postDescription.text = "This is a text description, it is intentionally long to test what happens to a long piece of text"
        //print ("Post Title: " + item.postTitle.text!)
        //print ("Post Desc: " + postDescription.text!)
    }
    
    func tableView(indexPath: NSIndexPath)
    {
        
        // Get the post to be shown
        let item: postDetailDataModel = feedItems[indexPath.row] as! postDetailDataModel
        
        //print ("Post Title: " + postTitle.text!)
        
        // Get references to labels of cell
        //postTitle.text = item.postTitle
        //postDescription.text = item.postDescription
    }


    
    
}

