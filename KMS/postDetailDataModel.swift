//
//  postDetailDataModel.swift
//  KMS
//
//  Created by John Le Houerou on 05/06/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import Foundation

class postDetailDataModel: NSObject {
    
    //properties
    
    var postTitle: String?
    var postDescription: String?
    var postCategory: String?
    //var userID: Int?
    
    //empty constructor
    override init()
    {
        
    }
    
    //construct
    init(postTitle: String, postDescription: String,postCategory: String) {
        
        self.postTitle = postTitle
        self.postDescription = postDescription
        self.postCategory = postCategory
        //self.userID = userID
        
    }
    
    //prints object's current state
    override var description: String
    {
        return "Post Title: \(postTitle), Post Description: \(postDescription), Category: \(postCategory)"
    }
}