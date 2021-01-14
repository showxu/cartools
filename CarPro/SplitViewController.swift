//
//  SplitViewController.swift
//  Cartools
//
//  Created by Xudong Xu on 1/14/21.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        toggleSidebar(self)
    }
}
