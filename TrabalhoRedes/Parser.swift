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
    
    init(location : String!) {
        super.init()
        do{
            self.fileContent = try String.init(contentsOfFile: location, encoding: NSUTF8StringEncoding).componentsSeparatedByString("\n")
            createNodes()
            print(nodes[0].ip)
        }catch{
            print("Ooops, Something goes wrong in file reading...")
        }
    }
    
    func createNodes() {
        for i in 0...fileContent.count{
            if fileContent[i] == "#NODE"{
                var j = i+1
                while fileContent[j] != "#ROUTER"{
                    let lineContents = fileContent[j].componentsSeparatedByString(",")
                    self.nodes.append(Node(ip: lineContents[2], macAddress: lineContents[1], name: lineContents[0], defaultGateway: lineContents[4], MTU: lineContents[3]))
                    j+=1
                }
            }
        }
    }
    
    
    
    
}