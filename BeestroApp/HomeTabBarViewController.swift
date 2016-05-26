//
//  HomeTabBarViewController.swift
//  BeestroApp
//
//  Created by python on 5/23/16.
//  Copyright © 2016 thettyl. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UITabBarController {
    
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
