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
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsDownloaded(items: NSArray)
    {
        feedItems = items
    }
    
    func tableView()
    {
        
        // Get the post to be shown
        let item: postDetailDataModel = feedItems[0] as! postDetailDataModel
        
        // Get references to labels of cell
        postTitle.text = item.postTitle
        postDescription.text = item.postDescription
    }


    
    
}

