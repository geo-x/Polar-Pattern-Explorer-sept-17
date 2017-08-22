//
//  View_1.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa


@IBDesignable




class CartesianView: NSView {

  //var omniViewPosition: NSPoint?
  
    
    
    //var endPoint: CGFloat = 20 //used in slider testing
    
    //var testColor: CGColor = CGColor(red: 0.2, green: 0.5, blue: 0.8, alpha: 0.08) //background cartesian
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        
        let scaleFactor:Int = 150 // multiplier for calculated sensitivity which ranges from 0 to 1
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
        
        var thisOmniArrayValue: CGFloat = CGFloat((omni.sensitivityValues [0]) as Float) //get zero index value for use in start point
        
        let omniStartPoint: CGPoint = CGPoint(x:self.bounds.origin.x, y: thisOmniArrayValue * CGFloat(scaleFactor) + centreOfView.y)
        

        
               
        //_ = NSGraphicsContext.current()?.cgContext
        
        let omniPath = NSBezierPath()
        
    
        omniPath.move(to: omniStartPoint)
        
//Swift.print(" omni startpoint \(omniStartPoint)")
        
        //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        // note the loop starts at 1 as the zero index holds the start value for initial move for path
        
        for i in 1...359 {
          let thisAngle = CGFloat(i)
            
          thisOmniArrayValue = CGFloat((omni.sensitivityValues [i]) as Float)
         
          let nextPoint: CGPoint = CGPoint(x: self.bounds.origin.x + thisAngle, y: thisOmniArrayValue * CGFloat(scaleFactor) + centreOfView.y )  //
            
          omniPath.line(to: nextPoint)
            
//Swift.print(nextPoint)
        
        }
//x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        
        //let omniColor = NSColor(calibratedHue: 0.5, saturation: 0.8, brightness: 0.8, alpha: 1)
        
        omniColor.setStroke()
        omniPath.lineWidth = 2
        omniPath.stroke()
        
        // round the view corners
        self.layer?.cornerRadius = 15
        
        
//Swift.print(" omni.micOrientationAngle from cart view is \(omni.micOrientationAngle)")

        
        // Drawing code here.
    }
   

}
