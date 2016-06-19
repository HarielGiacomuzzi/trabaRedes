//
//  Simulator.swift
//  TrabalhoRedes
//
//  Created by Hariel Giacomuzzi on 6/19/16.
//  Copyright © 2016 Giacomuzzi. All rights reserved.
//

import Foundation

class Simulator: NSObject {
    var midWay : [Node] = [Node]()
    
    func sendMessage(origin : Node, dest : Node, message : [Character]){
        if origin == dest {
            print("\(origin.name) rbox \(dest.name) : Received \(String(message));")
            return
        }
        if origin.arpTable[dest.name] == nil {
            madeArpReq(origin, destination: dest)
            sendMessage(origin, dest: dest, message: message)
        }else{
            sendICMPReq(origin, destination: dest, message: message)
        }
        sendICMPRep(dest, destination: origin)
    }
    
    private func sendICMPRep(origin : Node, destination : Node){
        print("\(origin.name) => \(destination.name) : ICMP - Echo (ping) reply (src=\(origin.printableIp) dst=\(destination.printableIp) ttl= 8 data=<msg>);")
    }
    
    private func sendICMPReq(origin : Node, destination : Node, message : [Character]){
        let messageArray = breakPackage(message, maxSize: destination.MTU)
        for messagePiece in messageArray{
            print("\(origin.name) => \(destination.name) : ICMP - Echo (ping) request (src=\(origin.printableIp) dst=\(destination.printableIp) ttl= 8 data=\(messagePiece));")
        }
        for messagePiece in messageArray{
            sendMessage(destination, dest: destination, message: [Character](messagePiece.characters))
        }
    }
    
    private func madeArpReq(origin : Node, destination : Node){
        if (isOnSameNet(origin, destination: destination)){
            printArpReq(origin, destination: destination)
            destination.arpTable[origin.name] = origin.macAddress
            printArpRep(destination, destination: origin)
            origin.arpTable[destination.name] = destination.macAddress
        }else{
            // send to router
        }
    }
    
    private func breakPackage(msg : [Character], maxSize : Int) -> [String]{
        var temp = [String]()
        var counter = 0
        var aux = ""
        for letter in message{
            counter += 1
            aux.append(letter)
            if counter >= maxSize{
                temp.append(aux)
                aux = ""
                counter = 0
            }
        }
        return temp
    }
    
    private func isOnSameNet(origin : Node, destination : Node) -> Bool{
            return true
    }
    
    private func printArpReq(origin : Node, destination : Node){
        print("\(origin.name) box \(origin.name) : ARP - Who has \(destination.printableIp)? Tell \(origin.printableIp);")
    }
    
    private func printArpRep(origin : Node, destination : Node){
        print("\(origin.name) => \(destination.name) : ARP - \(origin.printableIp) is at \(origin.macAddress);")
    }
}