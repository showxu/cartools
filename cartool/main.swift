//
//  CLI.swift
//  cartool
//
//  Created by Xudong Xu on 12/11/19.
//

import Cocoa
import CoreUI
import CoreThemeDefinition
import ArgumentParser
import Cartooldt

struct Cartool: ParsableCommand {

    @Argument(help: "The .car file path to parse.")
    var filePath: String
    
    @Argument(help: "Output dir to place extracted car file resources.")
    var output: String

    mutating func run() throws {
        let fileURL = URL(fileURLWithPath: filePath)
        let outputURL = URL(fileURLWithPath: output)
        print(fileURL, outputURL)
        let reader = try Reader(.init(fileURL))
        let renditions = try reader.read()
        try renditions.forEach { try $0.writeTo(outputURL) }
    }
}

Cartool.main()
