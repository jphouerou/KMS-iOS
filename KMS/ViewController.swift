//
//  ViewController.swift
//  KMS
//
//  Created by John Le Houerou on 05/05/2016.
//  Copyright © 2016 John Le Houerou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var loginMessage: UILabel!
    
    @IBOutlet var login: UIButton!
    
    @IBAction func loginCheck(sender: AnyObject) {
        
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
            
            // Laan van de Bork: 192.168.2.7.
            // Hunenbaan: 192.168.1.17
        let request = NSMutableURLRequest(URL: NSURL(string: "http://192.168.2.7/PHP/login.php")!)
        request.HTTPMethod = "POST"
        let postString = "email=\(email.text!)&password=\(password.text!)"
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
            
            if(responseString == "Successfully added.")
            {
                self.loginMessage.textColor = UIColor.greenColor()
                self.loginMessage.text = "Successful login."
                
                /*
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("search")
                self.showViewController(vc as! UIViewController, sender: vc) */
                
                let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("homepage") as UIViewController
                self.presentViewController(vc, animated: true, completion: nil)
 
            }
            else
            {
                self.loginMessage.textColor = UIColor.redColor()
                self.loginMessage.text = "Something went wrong."
            }
            
        }
        task.resume()
        }

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "cubes.jpg")!)
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

