//
//  View_1.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

class View_1: NSView {
    
    //var endPoint: CGFloat = 20
    
    var testColor: CGColor = CGColor(red: 0.9, green: 0.5, blue: 0.0, alpha: 1)
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let viewRect: NSRect = self.bounds
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
        
        Swift.print("view 1 updated")
       
        self.layer?.backgroundColor = testColor
        
        
        let omniPath = NSBezierPath()
        //omniPath.move(to: centreOfView)
        omniPath.move(to:  CGPoint(x:self.bounds.origin.x, y: centreOfView.y))
        
        omniPath.line(to: CGPoint(x: 200, y: 200))
        omniPath.stroke()

        
        
        
//        let myPath = NSBezierPath()
//        myPath.move(to: CGPoint(x: 20, y: 20))    //myPath.moveToPoint(CGPoint(x: 20, y: 20))
//        myPath.line(to: CGPoint(x: 200, y: endPoint))
//        myPath.stroke()
        
        // Drawing code here.
    }
    
}
