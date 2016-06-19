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
    var printableIp : String!
    var printableGateway : String!
    var macAddress : String!
    var name : String!
    var defaultGateway : [UInt8]!
    var MTU : Int!
    var arpTable = [String : String]()
    var messageReceived = [String]()
    
    init(ip : String, macAddress : String, name : String, defaultGateway : String, MTU : String) {
        super.init()
        self.ip = getIpParsed(ip)
        self.printableIp = ip
        self.printableGateway = defaultGateway
        self.name = name
        self.defaultGateway = getIpParsed(defaultGateway)
        self.MTU = Int(MTU)!
        self.macAddress = macAddress
    }
    
    func getIpParsed(ip : String) -> [UInt8]{
        var temp = [UInt8]()
        for aux in ip.componentsSeparatedByString("."){
            temp.append(UInt8(aux)!)
        }
        return temp
    }
}