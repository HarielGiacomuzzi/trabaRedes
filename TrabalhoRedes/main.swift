//
//  main.swift
//  TrabalhoRedes
//
//  Created by Hariel Giacomuzzi on 6/1/16.
//  Copyright © 2016 Giacomuzzi. All rights reserved.
//

import Foundation

let parser = Parser(location: Process.arguments[1])
let origem = parser.getNodebyName(Process.arguments[2])
let destino = parser.getNodebyName(Process.arguments[3])
let message = [Character](Process.arguments[4].characters)
let simulator = Simulator()

print("wordwraparcs=true,hscale=2.0;")
simulator.sendMessage(origem, dest: destino, message: message)





