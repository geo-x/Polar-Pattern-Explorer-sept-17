//
//  OmniAxisPointer.swift
//  Polar Pattern
//
//  Created by george on 30/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

let omniPointerLayer = CAShapeLayer()
var omniAngle:Float = 0



class OmniAxisPointer: NSView {
    
    var centrePoint = NSPoint(x: 0, y: 0)
  

    override func draw(_ dirtyRect: NSRect) {
        
        super.draw(dirtyRect)
        
        
        // note uses extension below to convert NSBesier to GCPath
        omniPointerLayer.path = createBezierPath().CGPath
        
        centrePoint.x = CGFloat(frame.size.width) / 2.0
        centrePoint.y = CGFloat(frame.size.height) / 2.0
        omniPointerLayer.path = createBezierPath().CGPath
        
        omniPointerLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        omniPointerLayer.position = CGPoint(x: centrePoint.x, y: centrePoint.y)
        omniPointerLayer.bounds = NSRect(x: 0, y: 0, width: 360, height: 330)
        
        
        omniPointerLayer.strokeColor = NSColor.green.cgColor
        omniPointerLayer.fillColor = NSColor.green.cgColor
        omniPointerLayer.lineWidth = 2.0
        
        omniPointerLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(Int(omniAngle).degreesToRadians) ))
        
        

        self.layer?.addSublayer(omniPointerLayer)
        
        // Drawing code here.
    }
    
    
    
    func createBezierPath() -> NSBezierPath {
        
        // create a new path
        let pointerShape = NSBezierPath()
        
        
        // starting point for the path (bottom left)
        
        
        let arrowStartPoint = NSPoint(x: centrePoint.x - 5, y: centrePoint.y)
        let arrowTopPoint  = NSPoint(x: centrePoint.x, y: centrePoint.y + 30)
        let arrowEndPoint = NSPoint(x: centrePoint.x + 5, y: centrePoint.y)
        
        pointerShape.move(to: arrowStartPoint)
        pointerShape.line(to: arrowTopPoint)
        pointerShape.line(to: arrowEndPoint)
        pointerShape.close()
        
        // **************************
        // ***** cursor line ********
        // **************************
        
        // segment 1: line
//        let topLinePoint = CGPoint(x: centrePoint.x, y: 315)
//        pointerShape.line(to: topLinePoint)
        
       
        
        
        return pointerShape
    }
    
    
    
}
