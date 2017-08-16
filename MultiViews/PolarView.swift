//
//  PolarView.swift
//  MultiViews
//
//  Created by george on 14/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa
var scaleFactor:Int = 150

@IBDesignable

class PolarView: NSView {
    
    

    var startAngle:Float = omni.micOrientationAngle.degreesToRadians
    
    

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)

        
        let omniPath = NSBezierPath()
        
        let startOmniArrayValue = CGFloat((omni.sensitivityValues [0]) as Float)
        let firstPoint = NSPoint(x: CGFloat(CGFloat(scaleFactor) * startOmniArrayValue ) * 0 + centreOfView.x  , y: CGFloat(CGFloat(scaleFactor) * startOmniArrayValue ) * 1 + centreOfView.y)
            
            
        omniPath.move(to: firstPoint)

Swift.print(" first point -> \(firstPoint)")
        
//        omniPath.move(to: NSPoint(x: CGFloat(scaleFactor ) * CGFloat(sin(startAngle)) + centreOfView.x  , y: CGFloat(scaleFactor ) * CGFloat(cos(startAngle)) + centreOfView.y ))
        
        for i in stride(from: 1, through: 359, by: 1){
            
            let radianValue: Float = i.degreesToRadians
            
            //omniPath.move(to: centreOfView)
            
            let thisOmniArrayValue = CGFloat((omni.sensitivityValues [i]) as Float)
            let nextPoint = NSPoint(x: CGFloat(CGFloat(scaleFactor) * thisOmniArrayValue ) * CGFloat(sin(radianValue)) + centreOfView.x  , y: CGFloat(CGFloat(scaleFactor) * thisOmniArrayValue ) * CGFloat(cos(radianValue)) + centreOfView.y )
            
           
            
            omniPath.line(to: nextPoint)
           
 Swift.print(" for point \(i) -> \(nextPoint)")
        }

        let omniColor = NSColor(calibratedHue: 0.5, saturation: 0.8, brightness: 0.8, alpha: 1)
        
        omniColor.setStroke()
        omniPath.lineWidth = 2
        omniPath.stroke()
        
        
        
        // Drawing code here.
    }
    
}
