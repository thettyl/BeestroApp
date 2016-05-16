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
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        HoursData.getObjectsWithCompletion( {(questions: [AnyObject]!, error: NSError!) -> () in
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
        if client.isAuthenticated(){
            statusLabel.text = "Click Here"
            self.navigationController?.performSegueWithIdentifier("showHours", sender: nil)
        }
        hoursText.hidden = false
        alertText.hidden = false
    
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


