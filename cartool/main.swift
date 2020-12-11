//
//  CLI.swift
//  cartool
//
//  Created by Xudong Xu on 12/11/19.
//

import ArgumentParser
import CartoolKit

struct Cartool: ParsableCommand {

    @Argument(help: "The .car file path to parse.")
    var filePath: String

    mutating func run() throws {
        //
    }
}

Cartool.main()
