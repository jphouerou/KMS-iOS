//
//  dataModel.swift
//  KMS
//
//  Created by John Le Houerou on 01/06/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import Foundation

class dataModel: NSObject {
    
    //properties
    
    //var postID: Int?
    var postTitle: String?
    var postCategory: String?
    //var postID: Int?
    
    //empty constructor
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    //init(postID: Int, postTitle: String, postCategory: String) {
    init(postTitle: String, postCategory: String) {
        
        //self.postID = postID
        self.postTitle = postTitle
        self.postCategory = postCategory
        //self.postID = postID
        
    }
    
    //prints object's current state
    override var description: String
    {
        //return "Post ID: \(postID), Post Title: \(postTitle), Category: \(postCategory)"
        return "Post Title: \(postTitle), Category: \(postCategory)"
    }
}