//
//  RegisterController.swift
//  KMS
//
//  Created by John Le Houerou on 29/05/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import Foundation
import UIKit

class RegisterController: UIViewController {
    
    // Registration Fields
    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    @IBOutlet var department: UITextField!
    @IBOutlet var skills: UITextField!
    @IBOutlet var function: UITextField!
    @IBOutlet var about: UITextField!
    @IBOutlet var message: UILabel!
    
    //var blank = ""
    //self.message.text = blank
    
    // Submit button
    @IBOutlet var register: UIButton!
    
    @IBAction func submit(sender: AnyObject) {
        
        if (name.text!.isEmpty || email.text!.isEmpty || password.text!.isEmpty || department.text!.isEmpty)
        {
            self.message.textColor = UIColor.redColor()
            self.message.text = "You must fill in all required fields."
            return
        }
        else if (password.text != confirmPassword.text)
        {
            self.message.textColor = UIColor.redColor()
            self.message.text = "Passwords don't match."
            return
        }
        else
        {
        self.message.textColor = UIColor.blackColor()
        self.message.text = "Submitting..."
        let request = NSMutableURLRequest(URL: NSURL(string: "http://192.168.1.17/PHP/register.php")!)
        request.HTTPMethod = "POST"
        let postString = "name=\(name.text!)&email=\(email.text!)&password=\(password.text!)&department=\(department.text!)&skills=\(skills.text!)&function=\(function.text!)&about=\(about.text!)"
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
            
            if(responseString == "This email is already being used")
            {
                self.message.textColor = UIColor.redColor()
                self.message.text = "E-mail is already registered."
            }
            else if(responseString == "Invalid email address")
            {
                self.message.textColor = UIColor.redColor()
                self.message.text = "Invalid email address"
            }
            else
            {
            self.message.text = "Succesfully registered."
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Login") as UIViewController
            self.presentViewController(vc, animated: true, completion: nil)
            }
        
        }
            task.resume()
        }
    }
    
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
    
    
}