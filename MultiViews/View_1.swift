//
//  View_1.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

class View_1: NSView {
    
    var endPoint: CGFloat = 20

    var testColor: CGColor = CGColor(red: 0.9, green: 0.5, blue: 0.0, alpha: 1)
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        
        Swift.print("view 1 updated")
        self.layer?.backgroundColor = testColor
        
        let myPath = NSBezierPath()
        myPath.move(to: CGPoint(x: 20, y: 20))    //myPath.moveToPoint(CGPoint(x: 20, y: 20))
        myPath.line(to: CGPoint(x: 200, y: endPoint))
        myPath.stroke()
        
        // Drawing code here.
    }
    
}
