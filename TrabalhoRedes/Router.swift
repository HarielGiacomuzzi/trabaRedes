//
//  Router.swift
//  TrabalhoRedes
//
//  Created by Hariel Giacomuzzi on 6/14/16.
//  Copyright © 2016 Giacomuzzi. All rights reserved.
//

import Foundation

class Router: NSObject {
    var name : String!
    var numPorts : Int!
    var MAClist : [String]!
    var IPlist : [[UInt8]] = [[UInt8]]()
    var MTUlist : [Int] = [Int]()
    var RouterTable = [RouterRule]()
    
    init(name : String, numPorts : String, MAClist : [String], IPlist : [String], MTUlist : [String]) {
        super.init()
        self.name = name
        self.numPorts = Int(numPorts)
        self.MAClist = MAClist
        for mtu in MTUlist{
            self.MTUlist.append(Int(mtu)!)
        }
        for ip in IPlist{
            let aux = ip.componentsSeparatedByString(".")
            var temp = [UInt8]()
            for number in aux{
                temp.append(UInt8(number)!)
            }
            self.IPlist.append(temp)
        }
    }
}