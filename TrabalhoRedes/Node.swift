//
//  Node.swift
//  TrabalhoRedes
//
//  Created by Hariel Giacomuzzi on 6/14/16.
//  Copyright © 2016 Giacomuzzi. All rights reserved.
//

import Foundation

class Node: NSObject {
    
    var ip = [UInt8]()
    var macAddress : String!
    var name : String!
    var defaultGateway : [UInt8]!
    var MTU : Int!
    
    init(ip : String, macAddress : String, name : String, defaultGateway : String, MTU : String) {
        for aux in ip.componentsSeparatedByString("."){
            self.ip += aux.utf8
        }
    }
}