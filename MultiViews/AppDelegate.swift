//
//  AppDelegate.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa



//******************** Globals ********************
//*************************************************

var testColor: CGColor = CGColor(red: 0.2, green: 0.5, blue: 0.8, alpha: 0.08) //background for graphs


//************************************************
//*******************  Global Colors *************


let gridColor = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.1, alpha: 0.3)
let axisColor = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.1, alpha: 0.7)
let omniColor = NSColor(hue: 0.3861, saturation: 1, brightness: 0.96, alpha: 1.0) /* #00f44d */
let biDirectionalColor = NSColor(calibratedHue: 0.8, saturation: 0.9, brightness: 0.8, alpha: 1)
let resultantlColor = NSColor(hue: 0.1167, saturation: 1, brightness: 0.96, alpha: 1.0) /* #f4ab00 */
let cursorColor = NSColor(hue: 0.975, saturation: 1, brightness: 0.95, alpha: 1.0) /* #f20024 */
let pointerColor = NSColor(hue: 0.975, saturation: 1, brightness: 0.95, alpha: 0.5) /* #f20024 */


//************************************************
//*********  Show Hide Rect Colors ***************

let omniRectHiStroke = NSColor(hue: 0.3861, saturation: 1, brightness: 0.96, alpha: 1.0)
let omniRectHiFill = NSColor(hue: 0.3861, saturation: 1, brightness: 0.96, alpha: 1.0)
let omniRectLoStroke = NSColor(hue: 0.3861, saturation: 1, brightness: 0.96, alpha: 1.0)
let omniRectLoFill = NSColor(hue: 0.3861, saturation: 1, brightness: 0.96, alpha: 0.1)
//
//let biRectHiStroke = NSColor
//let biRectHiFill = NSColor
//let biRectLoStroke = NSColor
//let biRectLoFill = NSColor
//
//let resRectHiStroke = NSColor
//let resRectHiFill = NSColor
//let resRectLoStroke = NSColor
//let resRectLoFill = NSColor



@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

