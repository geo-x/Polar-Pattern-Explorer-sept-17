//
//  CartesianDrag.swift
//  MultiViews
//
//  Created by george on 21/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa
@IBDesignable

class CartesianDrag: NSView {

    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        
    
        
        
        //self.postsFrameChangedNotifications = false
       
        Swift.print("original origin is \(self.frame.origin)")
        let expandSize: CGFloat = 20.0
        let newOrigin: NSPoint = NSPoint(x: self.frame.origin.x - expandSize/2, y: self.frame.origin.y - expandSize/2)
        
       
        
        //Swift.print("outerRectSize = \(outerRectSize)")
       
        
        setFrameSize(NSSize(width: 400, height: 370)) ///hardcoded as
     
        setFrameOrigin(newOrigin)
//        let backgroundColor = NSColor.red
//        backgroundColor.set()
//        NSBezierPath.fill(bounds)
        
        let bottomOFCursor:NSPoint = NSPoint(x: self.bounds.origin.x + 20, y: self.bounds.origin.y + 35)
        let topOfCursor:NSPoint = NSPoint(x: self.bounds.origin.x + 20, y: self.bounds.height - 20)
        let transform = CGAffineTransform(translationX: -5, y: -5)
        let centreOfDragCircle = __CGPointApplyAffineTransform(topOfCursor, transform)
        
        let cursorShape = NSBezierPath()
        cursorShape.move(to:bottomOFCursor)
        cursorShape.line(to: topOfCursor)
        
        let dragCircle = NSBezierPath()
        dragCircle.appendOval(in: NSRect(origin: centreOfDragCircle, size: CGSize(width: 10, height: 10)))
        
        let cursorColor = NSColor(calibratedHue: 0.9, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        
        cursorColor.setStroke()
        cursorColor.setFill()
        cursorShape.lineWidth = 2.0
        cursorShape.stroke()
        dragCircle.stroke()
        dragCircle.fill()

        
        
        // Drawing code here.
    }
   
    

}

