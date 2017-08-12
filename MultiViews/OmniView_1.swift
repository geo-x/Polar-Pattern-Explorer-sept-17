//
//  View_1.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

class OmniView_1: NSView {
    
   var endPoint: CGFloat = 20
    
    var testColor: CGColor = CGColor(red: 0.2, green: 0.5, blue: 0.8, alpha: 0.2)
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let viewRect: NSRect = self.bounds
        
        let scaleFactor:Int = 50 // multiplier for calculated sensitivity which ranges from 0 to 1
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
        
        var thisOmniArrayValue: CGFloat = CGFloat((omni.sensitivityValues [0]) as Float) //get zero index value for use in start point
        var omniStartPoint: CGPoint = CGPoint(x:self.bounds.origin.x, y: thisOmniArrayValue * CGFloat(scaleFactor) + centreOfView.y)
        
        
        
        
        let axisStartPoint: CGPoint = CGPoint(x:self.bounds.origin.x, y: centreOfView.y + CGFloat(scaleFactor))
        
        
        Swift.print("view 1 updated")
       
        self.layer?.backgroundColor = testColor
        
        let omniContext = NSGraphicsContext.current()?.cgContext
        let omniPath = CGMutablePath()   //changed from NSBezierPath()
    
        omniPath.move(to: omniStartPoint)
        Swift.print(" omni startpoint \(omniStartPoint)")
        
//x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        // note the loop starts at 1 as the zero index holds the start value for initial move for path
        
        for i in 1...359 {
          let thisAngle = CGFloat(i)
            
          thisOmniArrayValue = CGFloat((omni.sensitivityValues [i]) as Float)
         
          var nextPoint: CGPoint = CGPoint(x: axisStartPoint.x + thisAngle, y: thisOmniArrayValue * CGFloat(scaleFactor) + centreOfView.y )  //
            
          omniPath.addLine(to: nextPoint)
        
        }
//x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        
        var testColor2: NSColor = NSColor(hue: 0.338, saturation: 1, brightness: 1, alpha: 1)
        omniContext?.setStrokeColor(testColor2.cgColor)
        omniContext?.addPath(omniPath)
        omniContext?.strokePath()
        
        //omniPath.line(to: CGPoint(x: 200, y: 200))
        //omniPath.stroke()

        
        
        
//        let myPath = NSBezierPath()
//        myPath.move(to: CGPoint(x: 20, y: 20))    //myPath.moveToPoint(CGPoint(x: 20, y: 20))
//        myPath.line(to: CGPoint(x: 200, y: endPoint))
//        myPath.stroke()
        
        // Drawing code here.
    }
    
}
