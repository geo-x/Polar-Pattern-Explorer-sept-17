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
    
    var testColor: CGColor = CGColor(red: 0.9, green: 0.5, blue: 0.0, alpha: 1)
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let viewRect: NSRect = self.bounds
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
        let startPoint: CGPoint = CGPoint(x:self.bounds.origin.x, y: centreOfView.y)
        let scaleFactor:Int = 50
        
        Swift.print("view 1 updated")
       
        self.layer?.backgroundColor = testColor
        
        let omniContext = NSGraphicsContext.current()?.cgContext
        let omniPath = CGMutablePath()   //changed from NSBezierPath()
    
        omniPath.move(to:  startPoint)
        
        for i in 0...359 {
           let thisAngle = CGFloat(i)
            
          var thisArrayValue: CGFloat = CGFloat((omni.sensitivityValues [i]) as Float)
         
          var nextPoint: CGPoint = CGPoint(x: startPoint.x + thisAngle, y: thisArrayValue * CGFloat(scaleFactor) + centreOfView.y )  //
            
          omniPath.addLine(to: nextPoint)
          
        
        }
        
        
        
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
