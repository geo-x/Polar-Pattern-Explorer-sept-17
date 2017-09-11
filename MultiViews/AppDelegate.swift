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

var graphBackgroundColor: CGColor = CGColor(red: 0.2, green: 0.5, blue: 0.8, alpha: 0.08) //background for graphs



//************************************************
//*******************  Global Colors *************


let gridColor = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.1, alpha: 0.2)
let axisColor = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.1, alpha: 0.5)
let omniColor = NSColor(hue: 0.5222, saturation: 0.65, brightness: 0.97, alpha: 1.0) /* #56e1f7 */
let biDirectionalColor = NSColor(hue: 0.9694, saturation: 0.62, brightness: 0.95, alpha: 1.0) /* #f2133c */
let resultantlColor = NSColor(hue: 0.7472, saturation: 0.66, brightness: 0.95, alpha: 1.0) /* #9f52f2 */
let cursorColor = NSColor(hue: 0.975, saturation: 1, brightness: 0.95, alpha: 1.0) /* #f20024 */
let pointerColor = NSColor(hue: 0.975, saturation: 1, brightness: 0.95, alpha: 0.5) /* #f20024 */

let resultantlColorFill = NSColor(hue: 0.7472, saturation: 0.66, brightness: 0.95, alpha: 0.1) /* #9f52f2 */


//************************************************
//*********  Show Hide Rect Colors ***************

let omniRectHiStroke = NSColor(hue: 0.5222, saturation: 0.65, brightness: 0.97, alpha: 1.0) /* #56e1f7 */
let omniRectHiFill = NSColor(hue: 0.5222, saturation: 0.65, brightness: 0.97, alpha: 1.0) /* #56e1f7 */
let omniRectLoStroke = NSColor(hue: 0.5222, saturation: 0.65, brightness: 0.97, alpha: 1.0) /* #56e1f7 */
let omniRectLoFill = NSColor(hue: 0.5222, saturation: 0.65, brightness: 0.97, alpha: 0.2) /* #56e1f7 */
//
let biRectHiStroke  = NSColor(hue: 0.9694, saturation: 0.62, brightness: 0.95, alpha: 1.0) /* #f2133c */
let biRectHiFill  = NSColor(hue: 0.9694, saturation: 0.62, brightness: 0.95, alpha: 1.0) /* #f2133c */
let biRectLoStroke  = NSColor(hue: 0.9694, saturation: 0.62, brightness: 0.95, alpha: 1.0) /* #f2133c */
let biRectLoFill = NSColor(hue: 0.9694, saturation: 0.62, brightness: 0.95, alpha: 0.2) /* #f2133c */
//
let resRectHiStroke = NSColor(hue: 0.7472, saturation: 0.66, brightness: 0.95, alpha: 1.0) /* #9f52f2 */
let resRectHiFill = NSColor(hue: 0.7472, saturation: 0.66, brightness: 0.95, alpha: 1.0) /* #9f52f2 */
let resRectLoStroke = NSColor(hue: 0.7472, saturation: 0.66, brightness: 0.95, alpha: 1.0) /* #9f52f2 */
let resRectLoFill = NSColor(hue: 0.7472, saturation: 0.66, brightness: 0.95, alpha: 0.2) /* #9f52f2 */

//************************************************
//*********  Show Hide Rects ***************

let omniRect = NSBezierPath()
let biRect = NSBezierPath()
let resultRect = NSBezierPath()
//************************************************

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
      
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

