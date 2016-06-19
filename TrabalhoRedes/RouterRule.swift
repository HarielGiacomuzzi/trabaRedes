//
//  Enums.swift
//  TrabalhoRedes
//
//  Created by Hariel Giacomuzzi on 6/14/16.
//  Copyright © 2016 Giacomuzzi. All rights reserved.
//

import Foundation

class RouterRule: NSObject {
    var destination = [UInt8]()
    var nextHop = [UInt8]()
    var port : Int!
    
    init(destinations : String, nextHop : String, port : String) {
        self.port = Int(port)!
        //process destination IP
        let aux = destinations.componentsSeparatedByString(".")
        var temp = [UInt8]()
        for number in aux{
            temp.append(UInt8(number)!)
        }
        self.destination = temp
        
        //process nextHop IP
        let aux2 = nextHop.componentsSeparatedByString(".")
        var temp2 = [UInt8]()
        for number in aux2{
            temp2.append(UInt8(number)!)
        }
        self.nextHop = temp2
    }
}