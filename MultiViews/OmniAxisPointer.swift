//
//  OmniAxisPointer.swift
//  Polar Pattern
//
//  Created by george on 30/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

let omniPointerLayer = CAShapeLayer()
let biPointerLayer =   CAShapeLayer()

var omniAngle:Float = 0
var biAngle:Float = 0


class OmniAxisPointer: NSView {
    
    var centrePoint = NSPoint(x: 0, y: 0)
  

    override func draw(_ dirtyRect: NSRect) {
        
        super.draw(dirtyRect)
        
        // ********************************************
        // ***** set up omni pointer stuff ************
        // ********************************************
        
        
       
        omniPointerLayer.path = createBezierPath().CGPath   // note uses extension below to convert NSBesier to GCPath
        
        centrePoint.x = CGFloat(frame.size.width) / 2.0
        centrePoint.y = CGFloat(frame.size.height) / 2.0
        omniPointerLayer.path = createBezierPath().CGPath
        
        omniPointerLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        omniPointerLayer.position = CGPoint(x: centrePoint.x, y: centrePoint.y)
        omniPointerLayer.bounds = NSRect(x: 0, y: 0, width: 360, height: 330)
        
        // ********************************************
        // ***** stroke omni pointer ******************
        // ********************************************
        
        omniPointerLayer.lineDashPattern = [2,3,2,3]
        
        omniPointerLayer.strokeColor = omniColor.cgColor
        omniPointerLayer.fillColor = omniColor.cgColor
        omniPointerLayer.lineWidth = 1.0
         omniPointerLayer.speed = 10
         self.layer?.addSublayer(omniPointerLayer)
        
        
        // ********************************************
        // ***** control rotation omni pointer ********
        // ********************************************
        omniPointerLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(Int(omniAngle).degreesToRadians) ))
        
        
        //***********************************************************************************************************
        //********** same process for bi pointer  *******************************************************************
        //***********************************************************************************************************
        
        
        // ********************************************
        // ***** set up bi pointer stuff ************
        // ********************************************
        
       biPointerLayer.path = createBezierPath().CGPath   // note uses extension below to convert NSBesier to GCPath
        
        centrePoint.x = CGFloat(frame.size.width) / 2.0
        centrePoint.y = CGFloat(frame.size.height) / 2.0
        biPointerLayer.path = createBezierPath().CGPath
        
        biPointerLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        biPointerLayer.position = CGPoint(x: centrePoint.x, y: centrePoint.y)
        biPointerLayer.bounds = NSRect(x: 0, y: 0, width: 360, height: 330)
        
        // ********************************************
        // ***** stroke bi pointer ******************
        // ********************************************
        
        biPointerLayer.lineDashPattern = [2,3,2,3]
        
        biPointerLayer.strokeColor =  biDirectionalColor.cgColor
        biPointerLayer.fillColor = biDirectionalColor.cgColor
        biPointerLayer.lineWidth = 1.0
        biPointerLayer.speed = 10
        self.layer?.addSublayer(biPointerLayer)
        
        
        // ********************************************
        // ***** control rotation bi pointer ********
        // ********************************************
        biPointerLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(Int(biAngle).degreesToRadians) ))

        
        
        
        
        
        
        
        
        
        
        
        // Drawing code here.
    }
    
    
    
    func createBezierPath() -> NSBezierPath {
        
        // create a new path
        let pointerShape = NSBezierPath()
        
        
//        // starting point for the path
//        
//        let arrowStartPoint = NSPoint(x: centrePoint.x - 5, y: centrePoint.y)
//        let arrowTopPoint  = NSPoint(x: centrePoint.x, y: centrePoint.y + 30)
//        let arrowEndPoint = NSPoint(x: centrePoint.x + 5, y: centrePoint.y)
//        
//        pointerShape.move(to: arrowStartPoint)
//        pointerShape.line(to: arrowTopPoint)
//        pointerShape.line(to: arrowEndPoint)
//        pointerShape.close()
        
        // **************************
        // ***** omni pointer ********
        // **************************
        
          let scaleFactor:CGFloat = 150
        
        
          let arrowTopPoint  = NSPoint(x: centrePoint.x , y: centrePoint.y + 163)
          pointerShape.move(to: centrePoint)
          pointerShape.line(to: arrowTopPoint)
        
          pointerShape.appendArc(withCenter: centrePoint, radius: scaleFactor, startAngle: 89, endAngle: 91)
          pointerShape.line(to: arrowTopPoint)
          pointerShape.close()
        
//        let dashPattern : [CGFloat] = [3, 3]
//        pointerShape.setLineDash(dashPattern, count: 2, phase: 0)
//        pointerShape.stroke()
        
        return pointerShape
    }
    
    
    
}
