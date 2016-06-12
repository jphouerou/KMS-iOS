//
//  ViewController.swift
//  KMS
//
//  Created by John Le Houerou on 05/05/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import UIKit
//import SwiftDDP


class ViewController: UIViewController {

    // UI Outlets
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var loginMessage: UILabel!
    @IBOutlet var login: UIButton!
    
    // Login is pressed
    @IBAction func loginCheck(sender: AnyObject)
    {
        // Check if fields have been filled in
        if (email.text!.isEmpty || password.text!.isEmpty)
        {
            self.loginMessage.textColor = UIColor.redColor()
            self.loginMessage.text = "Email or password missing."
            return
        }
        else
        {
            self.loginMessage.textColor = UIColor.blackColor()
            self.loginMessage.text = "Logging in..."
            
            /* IP Addresses | Note: Localhost isn't allowed due to security issues
            // Laan van de Bork:    192.168.2.7.
            // Hunenbaan:           192.168.1.17
            */
        
            // E-mail & Password are sent to server, Email is checked for validation first
            let request = NSMutableURLRequest(URL: NSURL(string: "http://192.168.2.7/PHP/login.php")!)
            request.HTTPMethod = "POST"
            let postString = "email=\(email.text!)&password=\(password.text!)"
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            // If error, it is printed into the XCode log
            if error != nil {
                print("error=\(error)")
                return
            }
            
            // Response is printed into XCode log
            print("response = \(response)")
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            
            // If Login is successful, user is logged in and the homepage is loaded
            if(responseString == "Successfully added.")
            {
                // In case view tranistion is slow, message is shown to user
                self.loginMessage.textColor = UIColor.greenColor()
                self.loginMessage.text = "Successful login."
                
                /* Alternative view load
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("search")
                self.showViewController(vc as! UIViewController, sender: vc) */
                
                // Load homepage view
                let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("homepage") as UIViewController
                self.presentViewController(vc, animated: true, completion: nil)
 
            }
            // Display error if error
            else
            {
                self.loginMessage.textColor = UIColor.redColor()
                self.loginMessage.text = "Something went wrong."
            }
            
        }
        task.resume()
        }
    }
    
    // Dismisses keyboard on touch
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    // On load
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "cubes.jpg")!)

        /* Old Meteor: Maybe be implemented if time permits
        //
        Meteor.client.allowSelfSignedSSL = true
        Meteor.client.logLevel = .Info
        Meteor.connect("wss://192.168.1.17:3000/websocket") {
            // do something after the client connects
            print ("Meteor connect.")
        }
        */
        
        // Do any additional setup after loading the view, typically from a nib.
        //let url = NSURL (string: "https://m.facebook.com/");
        //let requestObj = NSURLRequest(URL: url!);
        //webview.loadRequest(requestObj);
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

