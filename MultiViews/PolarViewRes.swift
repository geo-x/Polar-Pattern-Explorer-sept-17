//
//  PolarViewRes.swift
//  MultiViews
//
//  Created by george on 18/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa


@IBDesignable

class PolarViewRes: NSView {

    //var startAngle:Float = omni.micOrientationAngle.degreesToRadians
    
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
        
        var resultantArray: Array = [Float](repeating: 0.0, count: 360)
        
        for i in 0...359{
            
            resultantArray[i] = omni.sensitivityValues[i] + biDirectional.sensitivityValues [i]
            
        }
        
        let resultantPath = NSBezierPath()
        
        let startResultantArrayValue = CGFloat((resultantArray [0]) as Float)
        let firstPoint = NSPoint(x: CGFloat(CGFloat(scaleFactor) * abs(startResultantArrayValue) ) * 0 + centreOfView.x  , y: CGFloat(CGFloat(scaleFactor) * startResultantArrayValue ) * 1 + centreOfView.y)
        
        
        resultantPath.move(to: firstPoint)
        
       
        
        
        for i in stride(from: 1, through: 359, by: 1){
            
            let radianValue: Float = i.degreesToRadians
            
            let thisResultantArrayValue = CGFloat(abs((resultantArray [i]) as Float))
            
            let nextPoint = NSPoint(x: CGFloat(CGFloat(scaleFactor) * abs(thisResultantArrayValue) ) * CGFloat(sin(radianValue)) + centreOfView.x  , y: CGFloat(CGFloat(scaleFactor) * abs(thisResultantArrayValue) ) * CGFloat(cos(radianValue)) + centreOfView.y )
            
            resultantPath.line(to: nextPoint)
            
            // Swift.print(" for point \(i) -> \(nextPoint)")
            // Swift.print("------------cos radian value \(CGFloat(cos(radianValue)))")
            // Swift.print("------------this omniArrayValue \(thisOmniArrayValue)")
        }
        
        //let resultantlColor = NSColor(calibratedHue: 0.1, saturation: 0.9, brightness: 0.8, alpha: 1)
        
        resultantlColor.setStroke()
        resultantPath.lineWidth = 2
        resultantPath.stroke()
        
        // round the view corners
        self.layer?.cornerRadius = 15
        
        
        
        // Drawing code here.
    }
    
}
