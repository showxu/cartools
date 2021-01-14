//
//  AppDelegate.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 12/11/19.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.servicesProvider = Unarchiver()
        NSUpdateDynamicServices()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}
