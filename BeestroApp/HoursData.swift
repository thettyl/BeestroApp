//
//  HoursData.swift
//  BeestroApp
//
//  Created by python on 5/6/16.
//  Copyright © 2016 thettyl. All rights reserved.
//

import UIKit



class HoursData: BAAObject {
    
    
    var hours: String
    var alert: String
    
    
    
    override init(dictionary: [NSObject : AnyObject]!){
        self.hours = dictionary["hours"]! as! String
        self.alert = dictionary["alert"]! as! String
        
        super.init(dictionary : dictionary)
}
    override func collectionName() -> String! {
        return "document/BestroHoursData"
    }
}
