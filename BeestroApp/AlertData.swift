//
//  AlertData.swift
//  BeestroApp
//
//  Created by python on 5/24/16.
//  Copyright © 2016 thettyl. All rights reserved.
//

import UIKit

class AlertData: BAAObject {
    
    var alert: String
    
    override init(dictionary: [NSObject : AnyObject]!){
        
        self.alert = dictionary["alert"]! as! String
        
        super.init(dictionary : dictionary)
        
    }
    override func collectionName() -> String! {
        return "document/BeestroAlertData"
    }
    
}

