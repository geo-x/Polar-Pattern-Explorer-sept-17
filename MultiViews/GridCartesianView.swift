//
//  GridCartesianView.swift
//  MultiViews
//
//  Created by george on 14/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa


@IBDesignable

class GridCartesianView: NSView {
    
   
    
    
    func someFunction(name: String) -> Bool {
        return false
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        self.layer?.backgroundColor = testColor

        
        let yDivisions:Int = 22 // 20 plus 1 space at top and bottom
        let xDivisions:Int = 24  //15 degrees each
        
        
        let gridPath = NSBezierPath() //grid and axis lines
        
        //x horizontal lines
        for i in 0...yDivisions {
            gridPath.move(to: NSPoint(x:self.bounds.origin.x, y: (self.bounds.height / CGFloat(yDivisions)) * CGFloat(i) ) )
            
            gridPath.line(to: NSPoint(x: self.bounds.origin.x + self.bounds.width, y: (self.bounds.size.height / CGFloat(yDivisions)) * CGFloat(i) ) )
            
        }
        
        //y vertical lines
        for i in 0...xDivisions {
            
            gridPath.move(to: NSPoint(x: ((self.bounds.width / CGFloat(xDivisions)) * CGFloat(i)) , y: self.bounds.origin.y))
            
            gridPath.line(to: NSPoint(x: ((self.bounds.width / CGFloat(xDivisions)) * CGFloat(i)) , y: self.bounds.origin.y + self.bounds.size.height ))
            
            //let test1:NSPoint = NSPoint(x: ((self.bounds.origin.x / CGFloat(xDivisions)) * CGFloat(i)) , y: self.bounds.origin.y)
            //let test2:NSPoint = NSPoint(x: ((self.bounds.origin.x / CGFloat(xDivisions)) * CGFloat(i)) , y: self.bounds.origin.y + self.bounds.height )
            //Swift.print(" line from \(test1) to \(test2) i is \(i)")
            
        }
        
        // stroke them
        //let gridColor = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.1, alpha: 0.4)
        
        gridColor.setStroke()
        gridPath.lineWidth = 0.5
        gridPath.stroke()
        
        // now axis highlights
        
        let axisPath = NSBezierPath() //grid and axis lines
        axisPath.move(to: NSPoint(x: self.bounds.origin.x  , y: self.bounds.origin.y))
        
        axisPath.line(to: NSPoint(x: self.bounds.origin.x , y: self.bounds.origin.y + self.bounds.size.height ))
        
        
        for i in stride(from: 0, to: yDivisions, by: 5) {
            
            axisPath.move(to: NSPoint(x:self.bounds.origin.x, y: (self.bounds.height / CGFloat(yDivisions)) * CGFloat(i) + CGFloat(self.bounds.height / CGFloat(yDivisions)))  )
            
            axisPath.line(to: NSPoint(x: self.bounds.origin.x + self.bounds.width, y: (self.bounds.size.height / CGFloat(yDivisions)) * CGFloat(i) + CGFloat(self.bounds.height / CGFloat(yDivisions)))  )
            
        }
        
        for i in stride(from: 0, through: xDivisions, by: 6){
            
            axisPath.move(to: NSPoint(x: ((self.bounds.width / CGFloat(xDivisions)) * CGFloat(i)) , y: self.bounds.origin.y))
            
            axisPath.line(to: NSPoint(x: ((self.bounds.width / CGFloat(xDivisions)) * CGFloat(i)) , y: self.bounds.origin.y + self.bounds.size.height ))
        }
        
        
        
        
        //let axisColor = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.1, alpha: 1)
        axisColor.setStroke()
        axisPath.lineWidth = 0.5
        axisPath.stroke()
        
        //x-x-x-x-x-x-x-x-x-x--x
        //border
        self.layer?.borderWidth = 1
        self.layer?.borderColor = NSColor.black.cgColor
        
        // round the view corners
         self.layer?.cornerRadius = 15
    }
    

        
        
        
        // Drawing code here.
    
    
}
