//
//  View_1.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa


//@IBDesignable

class OmniView_1: NSView {
    
    
    var endPoint: CGFloat = 20 //used in slider testing
    
    var testColor: CGColor = CGColor(red: 0.2, green: 0.5, blue: 0.8, alpha: 0.08) //background cartesian
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        
        let scaleFactor:Int = 140 // multiplier for calculated sensitivity which ranges from 0 to 1
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
        
        var thisOmniArrayValue: CGFloat = CGFloat((omni.sensitivityValues [0]) as Float) //get zero index value for use in start point
        
        let omniStartPoint: CGPoint = CGPoint(x:self.bounds.origin.x, y: thisOmniArrayValue * CGFloat(scaleFactor) + centreOfView.y)
        
        //draw axis and grid x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        
        drawGraphGrid()
        
        
        
        Swift.print("view 1 updated")
       
        self.layer?.backgroundColor = testColor
        Swift.print("self is \(self)")
        
               
        let omniContext = NSGraphicsContext.current()?.cgContext
        let omniPath = CGMutablePath()   //changed from NSBezierPath()
    
        omniPath.move(to: omniStartPoint)
        Swift.print(" omni startpoint \(omniStartPoint)")
        
        //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        // note the loop starts at 1 as the zero index holds the start value for initial move for path
        
        for i in 1...359 {
          let thisAngle = CGFloat(i)
            
          thisOmniArrayValue = CGFloat((omni.sensitivityValues [i]) as Float)
         
          let nextPoint: CGPoint = CGPoint(x: self.bounds.origin.x + thisAngle, y: thisOmniArrayValue * CGFloat(scaleFactor) + centreOfView.y )  //
            
          omniPath.addLine(to: nextPoint)
        
        }
//x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        
        let testColor2: NSColor = NSColor(hue: 0.5, saturation: 0.405, brightness: 0.71, alpha: 1)
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
   
    func drawGraphGrid (){
        
        let divisions:Int = 22
        
        
        var axisPath = NSBezierPath()

        for i in 0...divisions {
        axisPath.move(to: NSPoint(x:self.bounds.origin.x, y: (self.bounds.size.height / CGFloat(divisions)) * CGFloat(i) ) )
        
        axisPath.line(to: NSPoint(x: self.bounds.origin.x + self.bounds.width, y: (self.bounds.size.height / CGFloat(divisions)) * CGFloat(i) ) )
        
        }
        let color = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.5, alpha: 1)
        color.setStroke()
        
        axisPath.lineWidth = 0.5
        axisPath.stroke()
        
//        let axisContext = NSGraphicsContext.current()?.cgContext
//        
//        let axisStartPoint: CGPoint = CGPoint(x:self.bounds.origin.x, y: self.bounds.size.height / 2 )
//        
//        let axisEndPoint: CGPoint = CGPoint(x:self.bounds.origin.x + self.bounds.width , y: self.bounds.size.height / 2 )
//        
//        let axisPath = CGMutablePath()
//        
//        axisPath.move(to: axisStartPoint)
//        
//        axisPath.addLine(to: axisEndPoint )
//        
//        (axisContext)!.saveGState()
//        let axisColor1: NSColor = NSColor(hue: 0.0, saturation: 0.0, brightness: 0.0, alpha: 1)
//        axisContext?.setLineWidth(0.5)
//        axisContext?.setStrokeColor(axisColor1.cgColor)
//        axisContext?.addPath(axisPath)
//        axisContext?.strokePath()
//        (axisContext)!.restoreGState()
//
//        self.setNeedsDisplay(self.bounds)
        
    }
    
    
    
}
