//
//  CartesianViewRes.swift
//  MultiViews
//
//  Created by george on 18/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa


@IBDesignable

class CartesianViewRes: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        
        let scaleFactor:Int = 150 // multiplier for calculated sensitivity which ranges from 0 to 1
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
        
        var resultantArray: Array = [Float](repeating: 0.0, count: 360)
        
        for i in 0...359{
            
            resultantArray[i] = omni.sensitivityValues[i] + biDirectional.sensitivityValues [i]
            
            
        }
        
        var thisResultantArrayValue: CGFloat = CGFloat((resultantArray [0]) as Float) //get zero index value for use in start point
        
        let resulatantStartPoint: CGPoint = CGPoint(x:self.bounds.origin.x, y: thisResultantArrayValue * CGFloat(scaleFactor) + centreOfView.y)
        
        
        
        
        
        
        let resultantPath = NSBezierPath()
        
        
        resultantPath.move(to: resulatantStartPoint)
        
        
        
        //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        // note the loop starts at 1 as the zero index holds the start value for initial move for path
        
        for i in 1...359 {
            let thisAngle = CGFloat(i)
            
            thisResultantArrayValue = CGFloat((resultantArray [i]) as Float)
            
            let nextPoint: CGPoint = CGPoint(x: self.bounds.origin.x + thisAngle, y: thisResultantArrayValue * CGFloat(scaleFactor) + centreOfView.y )  //
            
            resultantPath.line(to: nextPoint)
            
            //Swift.print(nextPoint)
            
        }
        //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        
        let resultantlColor = NSColor(calibratedHue: 0.1, saturation: 0.9, brightness: 0.8, alpha: 1)
        
        resultantlColor.setStroke()
        resultantPath.lineWidth = 2
        resultantPath.stroke()
        
        // round the view corners
        self.layer?.cornerRadius = 15
        
        
        //Swift.print(" omni.micOrientationAngle from cart view is \(omni.micOrientationAngle)")
        
        
        // Drawing code here.
    }

    
}
