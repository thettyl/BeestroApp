//
//  HomeViewController.swift
//  BeestroApp
//
//  Created by python on 5/17/16.
//  Copyright © 2016 thettyl. All rights reserved.
//

import UIKit
import MessageUI

class HomeViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    let client = BAAClient.sharedClient()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    required init(nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        let client = BAAClient.sharedClient()
        if !client.isAuthenticated(){
            self.navigationController?.performSegueWithIdentifier("showLogin", sender: nil)
        }
    }
    
        /*
        func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients(["kerry.robinson-mack@ssfs.org"])
        mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
        
        presentViewController(mail, animated: true, completion: nil)
        } else {
        // show failure alert
        }
        
        }
        
        func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
        }
        */
        
    @IBAction func sendEmailButtonTapped(sender: AnyObject) {
            let mailComposeViewController = configuredMailComposeViewController()
            
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
        }

        func configuredMailComposeViewController() -> MFMailComposeViewController {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
            
            mailComposerVC.setToRecipients(["kerry.robinson-mack@ssfs.org"])
            mailComposerVC.setSubject("May I Request Something for the Beestro?")
            mailComposerVC.setMessageBody("I would like to request...", isHTML: false)
            
            return mailComposerVC
        }
        
        //var alert=UIAlertController(title: "Alert 2", message: "Two is awesome too", preferredStyle: UIAlertControllerStyle.Alert)
        func showSendMailErrorAlert() {
            let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: UIAlertControllerStyle.Alert)
            showViewController(sendMailErrorAlert, sender: self)
            print("failure")
        }
        
        // MARK: MFMailComposeViewControllerDelegate
        
        
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
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
