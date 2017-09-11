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
        
        self.layer?.backgroundColor = graphBackgroundColor
        
        let scaleFactor:Int = 150 // multiplier for calculated sensitivity which ranges from 0 to 1
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
 
        
        
        
        // ********************************************
        // ***** angle divisions *********************
        // ********************************************
        
       // draw angle divisions on polar grid ..see stride for angle division
        
       let angleGrid = NSBezierPath()
        
       for i in stride(from: 0, through: 359, by: 15){
            
                let radianValue: Float = i.degreesToRadians
            
                angleGrid.move(to: centreOfView)
            
                let nextPoint = NSPoint(x: CGFloat(scaleFactor + 15) * CGFloat(sin(radianValue)) + centreOfView.x  , y: CGFloat(scaleFactor + 15) * CGFloat(cos(radianValue)) + centreOfView.y )
           
                angleGrid.line(to: nextPoint)
            
        
            }
        
        
        // *********************************************
        // ***** sensitivity divisions *****************
        // *********************************************
        
        // draw sensitivity divisions on polar grid
        
        let sensitivityGrid = NSBezierPath()
        
        for i in stride(from: 0, through: 150, by: 15){
            
          sensitivityGrid.appendArc(withCenter: centreOfView, radius: CGFloat(scaleFactor - i), startAngle: 0, endAngle: 360)
            
        }

        // *********************************************
        // ***** stroke grids *************************
        // *********************************************
        
        gridColor.setStroke()
        angleGrid.lineWidth = 0.5
        angleGrid.stroke()
        
    
        gridColor.setStroke()
        sensitivityGrid.lineWidth = 0.5
        sensitivityGrid.stroke()
        
        // *********************************************
        // ***** axis angle  *********************
        // *********************************************
        
        let angleAxis = NSBezierPath()
        
        for i in stride(from: 0, through: 359, by: 45){
            
            let radianValue: Float = i.degreesToRadians
            
            angleAxis.move(to: centreOfView)
            
            let nextPoint = NSPoint(x: CGFloat(scaleFactor + 15) * CGFloat(sin(radianValue)) + centreOfView.x  , y: CGFloat(scaleFactor + 15) * CGFloat(cos(radianValue)) + centreOfView.y )
            
            angleAxis.line(to: nextPoint)
            
        }
        
        // *********************************************
        // ***** axis sensitivity  *********************
        // *********************************************
        
        let sensitivityAxis = NSBezierPath()
       
        
        for i in stride(from: 75, through: 150, by: 75){
            
            sensitivityAxis.appendArc(withCenter: centreOfView, radius: CGFloat(i), startAngle: 0, endAngle: 360)
            sensitivityAxis.move(to: NSPoint(x: centreOfView.x - CGFloat(i), y: centreOfView.y))
            
        }

        
        // *********************************************
        // ***** stroke axis highlights*****************
        // *********************************************
        
        //let axisColor = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.1, alpha: 1)
        axisColor.setStroke()
        angleAxis.lineWidth = 1
        angleAxis.stroke()
        
        
        sensitivityAxis.lineWidth = 1
        sensitivityAxis.stroke()
        
        // *********************************************
        // ***** border around window  *****************
        // *********************************************
        
        self.layer?.borderWidth = 1
        self.layer?.borderColor = NSColor.black.cgColor
        
        // round the view corners
        self.layer?.cornerRadius = 15
        
        // Drawing code here.
    }
    
}
