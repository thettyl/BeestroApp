//
//  HoursViewController.swift
//  BeestroApp
//
//  Created by python on 5/4/16.
//  Copyright © 2016 thettyl. All rights reserved.
//

import UIKit

class HoursViewController: UIViewController {

    @IBOutlet weak var alertText: UITextView!
    @IBOutlet weak var hoursText: UITextView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var hours: [HoursData] = []
    var alerts: [AlertData] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        HoursData.getObjectsWithCompletion( {(hours: [AnyObject]!, error: NSError!) -> () in
            if error == nil{
                self.hours = hours as! [HoursData]
                self.hoursText.text = self.hours[0].hours
                self.hoursText.hidden = false
            } else{
                print("error getting hours from baasbox")
                
                }
            
        })

        
        
        
        AlertData.getObjectsWithCompletion( {(alerts: [AnyObject]!, error: NSError!) -> () in
            if error == nil{
                self.alerts = alerts as! [AlertData]
                self.alertText.text = self.alerts[0].alert
                self.alertText.hidden = false
            } else{
                print("error getting alert from baasbox")
            }
        })
        

        
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
            self.navigationController?.performSegueWithIdentifier("showHours", sender: nil)
        }
        
        

    
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


