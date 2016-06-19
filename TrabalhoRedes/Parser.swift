//
//  Parser.swift
//  TrabalhoRedes
//
//  Created by Hariel Giacomuzzi on 6/1/16.
//  Copyright © 2016 Giacomuzzi. All rights reserved.
//

import Foundation

class Parser: NSObject {
    
    var fileContent : [String]!
    var nodes = [Node]()
    var routers = [Router]()
    
    init(location : String!) {
        super.init()
        do{
            self.fileContent = try String.init(contentsOfFile: location, encoding: NSUTF8StringEncoding).componentsSeparatedByString("\n")
            createNodes()
        }catch{
            print("Ooops, Something goes wrong in file reading...")
        }
    }
    
    func createNodes() {
        for i in 0...fileContent.count-1{
            if fileContent[i] == "#NODE"{
                var j = i+1
                while fileContent[j] != "#ROUTER"{
                    let lineContents = fileContent[j].componentsSeparatedByString(",")
                    self.nodes.append(Node(ip: lineContents[2], macAddress: lineContents[1], name: lineContents[0], defaultGateway: lineContents[4], MTU: lineContents[3]))
                    j+=1
                }
            }
            if fileContent[i] == "#ROUTER"{
                var j = i+1
                while fileContent[j] != "#ROUTERTABLE"{
                    let lineContents = fileContent[j].componentsSeparatedByString(",")
                    var macs = [String]()
                    var ips = [String]()
                    var mtus = [String]()
                    
                    for i in 2...lineContents.count-2 where i%3 == 0 {
                        macs.append(lineContents[i-1])
                        ips.append(lineContents[i])
                        mtus.append(lineContents[i+1])
                        
                    }
                    self.routers.append(Router(name: lineContents[0], numPorts: lineContents[1], MAClist: macs, IPlist: ips, MTUlist: mtus))
                    j+=1
                }
            }
            if fileContent[i] == "#ROUTERTABLE"{
                var j = i+1
                while j < fileContent.count {
                    let lineContents = fileContent[j].componentsSeparatedByString(",")
                    let aux = RouterRule(destinations: lineContents[1], nextHop: lineContents[2], port: lineContents[3])
                    self.getRouterByName(lineContents[0]).RouterTable.append(aux)
                    j+=1
                }
            }
        }
    }
    
    func getNodebyName(name : String) -> Node{
        var aux = self.nodes.filter { (Node) -> Bool in
            Node.name == name
        }
        return aux[0]
    }
    
    func getRouterByName(name : String) -> Router{
        var aux = self.routers.filter { (Router) -> Bool in
            Router.name == name
        }
        return aux[0]
    }
    
}