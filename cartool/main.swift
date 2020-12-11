//
//  CLI.swift
//  cartool
//
//  Created by showxdxu on 12/11/20.
//

import ArgumentParser

struct Cartool: ParsableCommand {

    @Argument(help: "The .car file path to parse.")
    var filePath: String

    mutating func run() throws {
        //
    }
}

Cartool.main()
