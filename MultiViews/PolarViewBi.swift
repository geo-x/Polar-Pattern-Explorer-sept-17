//
//  PolarViewBi.swift
//  MultiViews
//
//  Created by george on 18/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa



@IBDesignable


class PolarViewBi: NSView {

    var startAngle:Float = omni.micOrientationAngle.degreesToRadians
    
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
        
        
        let biDirectionalPath = NSBezierPath()
        
        let startBiDirectionalArrayValue = CGFloat((biDirectional.sensitivityValues [0]) as Float)
//        let firstPoint = NSPoint(x: CGFloat(CGFloat(scaleFactor) * startBiDirectionalArrayValue ) * 0 + centreOfView.x  , y: CGFloat(CGFloat(scaleFactor) * startBiDirectionalArrayValue ) * 1 + centreOfView.y)
        
        let firstPoint = NSPoint(x: CGFloat(CGFloat(scaleFactor) * CGFloat(abs((biDirectional.sensitivityValues [0]) as Float)) ) * CGFloat(sin(0.0)) + centreOfView.x  , y: CGFloat(CGFloat(scaleFactor) * CGFloat(abs((biDirectional.sensitivityValues [0]) as Float)) ) * CGFloat(cos(0.0)) + centreOfView.y )
        
        
        biDirectionalPath.move(to: firstPoint)
        
        //Swift.print(" first point -> \(firstPoint)")
        
        
        for i in stride(from: 1, through: 359, by: 1){
            
            let radianValue: Float = i.degreesToRadians
            
            let thisBiDirectionalArrayValue = CGFloat(abs((biDirectional.sensitivityValues [i]) as Float))
            
            let nextPoint = NSPoint(x: CGFloat(CGFloat(scaleFactor) * thisBiDirectionalArrayValue ) * CGFloat(sin(radianValue)) + centreOfView.x  , y: CGFloat(CGFloat(scaleFactor) * thisBiDirectionalArrayValue ) * CGFloat(cos(radianValue)) + centreOfView.y )
            
            biDirectionalPath.line(to: nextPoint)
            
            // Swift.print(" for point \(i) -> \(nextPoint)")
            // Swift.print("------------cos radian value \(CGFloat(cos(radianValue)))")
            // Swift.print("------------this omniArrayValue \(thisOmniArrayValue)")
        }
        
        let biDirectionalColor = NSColor(calibratedHue: 0.8, saturation: 0.9, brightness: 0.8, alpha: 1)
        
        biDirectionalColor.setStroke()
        biDirectionalPath.lineWidth = 2
        biDirectionalPath.stroke()
        
        
        
        // Drawing code here.
    }
    
}
