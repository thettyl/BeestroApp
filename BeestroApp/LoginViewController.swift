//
//  LoginViewController.swift
//  BeestroApp
//
//  Created by python on 5/11/16.
//  Copyright © 2016 thettyl. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var passwordField: UITextField!
    
    let client = BAAClient.sharedClient()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    required init(nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordField.placeholder = "password"
        spinner.hidesWhenStopped = true
        errorLabel.text = ""

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTapped(sender: UIButton) {
        loginButton.enabled = false
        signupButton.enabled = false
        spinner.startAnimating()
        
        client.authenticateUser(usernameField.text, password: passwordField.text, completion: { (success: Bool, error: NSError!) -> () in
            self.spinner.stopAnimating()
            self.loginButton.enabled = true
            self.signupButton.enabled = true
            if success {
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                self.errorLabel.text = error.localizedDescription
            }
            })
    }
    
    @IBAction func signupTapped(sender: UIButton) {
        
        client.createUserWithUsername(usernameField.text, password: passwordField.text, completion: { (success: Bool, error: NSError!) -> () in
            self.spinner.stopAnimating()
            self.loginButton.enabled = true
            self.signupButton.enabled = true
            if success {
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                self.errorLabel.text = error.localizedDescription
            }
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

