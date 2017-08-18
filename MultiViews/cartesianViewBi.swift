//
//  cartesianViewBi.swift
//  MultiViews
//
//  Created by george on 18/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

@IBDesignable

class cartesianViewBi: NSView {

  
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        
        let scaleFactor:Int = 150 // multiplier for calculated sensitivity which ranges from 0 to 1
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
        
        var thisBiDirectionalArrayValue: CGFloat = CGFloat((biDirectional.sensitivityValues [0]) as Float) //get zero index value for use in start point
        
        let biDirectionalStartPoint: CGPoint = CGPoint(x:self.bounds.origin.x, y: thisBiDirectionalArrayValue * CGFloat(scaleFactor) + centreOfView.y)
        
        
        
        

        
        let biDirectionalPath = NSBezierPath()
        
        
        biDirectionalPath.move(to: biDirectionalStartPoint)
        
     
        
        //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        // note the loop starts at 1 as the zero index holds the start value for initial move for path
        
        for i in 1...359 {
            let thisAngle = CGFloat(i)
            
            thisBiDirectionalArrayValue = CGFloat((biDirectional.sensitivityValues [i]) as Float)
            
            let nextPoint: CGPoint = CGPoint(x: self.bounds.origin.x + thisAngle, y: thisBiDirectionalArrayValue * CGFloat(scaleFactor) + centreOfView.y )  //
            
            biDirectionalPath.line(to: nextPoint)
            
            //Swift.print(nextPoint)
            
        }
        //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        
        let biDirectionalColor = NSColor(calibratedHue: 0.8, saturation: 0.9, brightness: 0.8, alpha: 1)
        
        biDirectionalColor.setStroke()
       biDirectionalPath.lineWidth = 2
       biDirectionalPath.stroke()
        
        // round the view corners
        self.layer?.cornerRadius = 15
        
        
        //Swift.print(" omni.micOrientationAngle from cart view is \(omni.micOrientationAngle)")
        
        
        // Drawing code here.
    }
    
}
