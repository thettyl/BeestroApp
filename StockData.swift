//
//  StockData.swift
//  BeestroApp
//
//  Created by python on 5/25/16.
//  Copyright © 2016 thettyl. All rights reserved.
//

import UIKit

class StockData: BAAObject {
    
    var item: String
    var price: String
    
    override init(dictionary: [NSObject : AnyObject]!){
        
        self.item = dictionary["Item"]! as! String
        self.price = dictionary["Price"]! as! String
        
        super.init(dictionary : dictionary)
        
    }
    override func collectionName() -> String! {
        return "document/BeestroStockData"
    }


}
