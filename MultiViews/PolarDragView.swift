//
//  PolarDragView.swift
//  MultiViews
//
//  Created by george on 26/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

let cursorShapeLayer = CAShapeLayer()
var rotationAngle: Float = 0

//var centrePoint = NSPoint(x: 0, y: 0)

class PolarDragView: NSView {
    
    var centrePoint = NSPoint(x: 0, y: 0)
    
    //let cursorShape = NSBezierPath()
    //var dragCircle = NSBezierPath()
    

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        
        centrePoint.x = CGFloat(frame.size.width) / 2.0
        centrePoint.y = CGFloat(frame.size.height) / 2.0
        
        // note uses extension below to convert NSBesier to GCPath
        cursorShapeLayer.path = createBezierPath().CGPath
        
        
        cursorShapeLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        cursorShapeLayer.position = CGPoint(x: centrePoint.x, y: centrePoint.y)
        cursorShapeLayer.bounds = NSRect(x: 0, y: 0, width: 360, height: 330)
        
         //cursorShapeLayer.backgroundColor = NSColor.blue.cgColor
        
        
        // apply  properties related to the path
        cursorShapeLayer.strokeColor = NSColor.green.cgColor
        cursorShapeLayer.fillColor = NSColor.white.cgColor
        cursorShapeLayer.lineWidth = 1.0
       
        
        //Swift.print("anchor point is \(cursorShapeLayer.anchorPoint)")
        //Swift.print("frame is \(cursorShapeLayer.bounds)")
        
        cursorShapeLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(Int(-rotationAngle).degreesToRadians) ))
        
        self.layer?.addSublayer(cursorShapeLayer)
        
        
        
        
        
        
        // Drawing code here.
    }
    
    
    func createBezierPath() -> NSBezierPath {
        
        // create a new path
        let cursor = NSBezierPath()
        
        
        // starting point for the path (bottom left)
        
        
        
        cursor.move(to: centrePoint)
        
        // **************************
        // ***** cursor line ********
        // **************************
        
        // segment 1: line
        let topLinePoint = CGPoint(x: centrePoint.x, y: 315)
        cursor.line(to: topLinePoint)
        
        // *****************************
        // ***** drag circle shape *****
        // *****************************
        
        
        let dragCircle = NSBezierPath()
        let circleDiameter:CGFloat = 10
        dragCircle.appendOval(in: NSRect(origin: CGPoint(x: (topLinePoint.x - circleDiameter/2), y: topLinePoint.y  ), size: CGSize(width: circleDiameter, height: circleDiameter)))
        
        //add circle and line to make one NSBezierPath
        cursor.append(dragCircle)
        
        
        return cursor
    }
    
    
    
}
