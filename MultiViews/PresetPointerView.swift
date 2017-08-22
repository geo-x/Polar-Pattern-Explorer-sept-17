//
//  PresetPointerView.swift
//  MultiViews
//
//  Created by george on 22/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

var pointerStartPoint: NSPoint?

var range: CGFloat = 180.0
var pointerFeedback: CGFloat = 0.5


class PresetPointerView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        
        
        
        pointerStartPoint = NSPoint(x: self.bounds.origin.x + 1 , y: (pointerFeedback * range) + 10)
        var transform = CGAffineTransform(translationX: 20, y: 0)
        
        var pointerNextPoint = __CGPointApplyAffineTransform(pointerStartPoint!, transform)
        
        Swift.print("feedback = \(pointerFeedback)")
        
        let cursorShape = NSBezierPath()
        cursorShape.move(to:pointerStartPoint!)
        cursorShape.line(to: pointerNextPoint)
        
        transform = CGAffineTransform(translationX: 0, y: 4)
        pointerNextPoint = __CGPointApplyAffineTransform(pointerNextPoint, transform)
        cursorShape.line(to: pointerNextPoint)
       
        transform = CGAffineTransform(translationX: 10, y: -5)
        pointerNextPoint = __CGPointApplyAffineTransform(pointerNextPoint, transform)
        cursorShape.line(to: pointerNextPoint)

        transform = CGAffineTransform(translationX: -10, y: -5)
        pointerNextPoint = __CGPointApplyAffineTransform(pointerNextPoint, transform)
        cursorShape.line(to: pointerNextPoint)
        
        transform = CGAffineTransform(translationX: 0, y: 4)
        pointerNextPoint = __CGPointApplyAffineTransform(pointerNextPoint, transform)
        cursorShape.line(to: pointerNextPoint)
        
        transform = CGAffineTransform(translationX: -20, y: 0)
        pointerNextPoint = __CGPointApplyAffineTransform(pointerNextPoint, transform)
        cursorShape.line(to: pointerNextPoint)
        
        cursorShape.close()
        
        
        //let dragCircle = NSBezierPath()
        //dragCircle.appendOval(in: NSRect(origin: centreOfDragCircle, size: CGSize(width: 10, height: 10)))
        
        //let cursorColor = NSColor(calibratedHue: 0.9, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        
        cursorColor.setStroke()
        cursorColor.setFill()
        cursorShape.lineWidth = 2.0
        cursorShape.stroke()
        
        cursorShape.fill()
 
        
        
        
        
        
        
        // Drawing code here.
    }
    
}
