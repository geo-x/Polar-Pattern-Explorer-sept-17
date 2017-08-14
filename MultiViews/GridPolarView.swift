//
//  GridPolarView.swift
//  MultiViews
//
//  Created by george on 14/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

 
@IBDesignable

class GridPolarView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        self.layer?.backgroundColor = testColor
        
        let scaleFactor:Int = 150 // multiplier for calculated sensitivity which ranges from 0 to 1
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
 
        
        
        
//x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-
        
       // draw angle divisions on polar grid ..see stride for angle division
        
       let angleGrid = NSBezierPath()
        
       for i in stride(from: 0, through: 359, by: 15){
            
                let radianValue: Float = i.degreesToRadians
            
                angleGrid.move(to: centreOfView)
            
              let nextPoint = NSPoint(x: CGFloat(scaleFactor + 15) * CGFloat(sin(radianValue)) + centreOfView.x  , y: CGFloat(scaleFactor + 15) * CGFloat(cos(radianValue)) + centreOfView.y )
           
               angleGrid.line(to: nextPoint)
            
        
            }
        
        //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        // draw sensitivity divisions on polar grid
        
        let sensitivityGrid = NSBezierPath()
        sensitivityGrid.appendArc(withCenter: centreOfView, radius: CGFloat(scaleFactor + 15), startAngle: 0, endAngle: 360)
        
        for i in stride(from: 0, through: 330, by: 15){
            
          sensitivityGrid.appendArc(withCenter: centreOfView, radius: CGFloat(scaleFactor + 15 - i), startAngle: 0, endAngle: 360)
            
        }

        //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x--x-x-x-x-x-x
        // stroke them
        let gridColor = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.1, alpha: 0.4)
       
        gridColor.setStroke()
        angleGrid.lineWidth = 0.5
        angleGrid.stroke()
        
    
        gridColor.setStroke()
        sensitivityGrid.lineWidth = 0.5
        sensitivityGrid.stroke()
        
        //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x--x-x-x-x-x-x-x-x-x-x-x-x-x-x--x
        //x-x-x-x-x- Now highlighted axis divisions
        
        let angleAxis = NSBezierPath()
        
        for i in stride(from: 0, through: 359, by: 90){
            
            let radianValue: Float = i.degreesToRadians
            
            angleAxis.move(to: centreOfView)
            
            let nextPoint = NSPoint(x: CGFloat(scaleFactor + 15) * CGFloat(sin(radianValue)) + centreOfView.x  , y: CGFloat(scaleFactor + 15) * CGFloat(cos(radianValue)) + centreOfView.y )
            
            angleAxis.line(to: nextPoint)
            
        }
        
        //x-x-x-x-x-x-x
        
        let sensitivityAxis = NSBezierPath()
        //sensitivityAxis.appendArc(withCenter: centreOfView, radius: CGFloat(scaleFactor + 15), startAngle: 0, endAngle: 360)
        
        for i in stride(from: 0, through: 150, by: 75){
            
            sensitivityAxis.appendArc(withCenter: centreOfView, radius: CGFloat(i), startAngle: 0, endAngle: 360)
            
        }

        
        
        //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
        //x-x-x-x-x-x- stroke axis highlights
        
        let axisColor = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.1, alpha: 1)
        axisColor.setStroke()
        angleAxis.lineWidth = 0.5
        angleAxis.stroke()
        
        
        sensitivityAxis.lineWidth = 0.5
        sensitivityAxis.stroke()
        
        //x-x-x-x-x-x-x-x-x-x--x
        //border
        self.layer?.borderWidth = 1
        self.layer?.borderColor = NSColor.black.cgColor
        
        // round the view corners
        self.layer?.cornerRadius = 15
        
        // Drawing code here.
    }
    
}
