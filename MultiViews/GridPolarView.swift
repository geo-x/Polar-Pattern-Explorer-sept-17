//
//  GridPolarView.swift
//  MultiViews
//
//  Created by george on 14/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

 var testColor: CGColor = CGColor(red: 0.2, green: 0.5, blue: 0.8, alpha: 0.08) //background cartesian


class GridPolarView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        
        let scaleFactor:Int = 150 // multiplier for calculated sensitivity which ranges from 0 to 1
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)
        
       
        
        
        self.layer?.backgroundColor = testColor
        
       
        
         let sensitivityGrid = NSBezierPath()
        
        
        
       for i in stride(from: 0, through: 359, by: 15){
            
                let radianValue: Float = i.degreesToRadians
            
                sensitivityGrid.move(to: centreOfView)
            
              var nextPoint = NSPoint(x: CGFloat(scaleFactor + 15) * CGFloat(sin(radianValue)) + centreOfView.x  , y: CGFloat(scaleFactor + 15) * CGFloat(cos(radianValue)) + centreOfView.y )
           
               sensitivityGrid.line(to: nextPoint)
            
            Swift.print("nextpoint is \(nextPoint)")
            }
        
        
        
        // stroke them
        var gridColor = NSColor(calibratedHue: 0.8, saturation: 0.8, brightness: 0.1, alpha: 0.4)
       
        gridColor.setStroke()
        sensitivityGrid.lineWidth = 0.5
        sensitivityGrid.stroke()
        
        // Drawing code here.
    }
    
}

//for i in 0...359 {
//    
//    let radianValue: Float = i.degreesToRadians
//    sensitivityValues[i] = (pressureOp + (cos(radianValue) * pressureGrad)) * gain
//}
