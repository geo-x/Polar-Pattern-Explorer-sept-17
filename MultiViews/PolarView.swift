//
//  PolarView.swift
//  MultiViews
//
//  Created by george on 14/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa
var scaleFactor:Int = 150

class PolarView: NSView {

    var startAngle:Float = 0.degreesToRadians
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let centreOfView: CGPoint = CGPoint(x:self.bounds.width / 2 , y: self.bounds.height / 2)

        
        let omniPath = NSBezierPath()
        
        omniPath.move(to: NSPoint(x: CGFloat(scaleFactor ) * CGFloat(sin(startAngle)) + centreOfView.x  , y: CGFloat(scaleFactor ) * CGFloat(cos(startAngle)) + centreOfView.y ))
        
        for i in stride(from: 0, through: 359, by: 1){
            
            let radianValue: Float = i.degreesToRadians
            
            //omniPath.move(to: centreOfView)
            
            var nextPoint = NSPoint(x: CGFloat(scaleFactor ) * CGFloat(sin(radianValue)) + centreOfView.x  , y: CGFloat(scaleFactor ) * CGFloat(cos(radianValue)) + centreOfView.y )
            
            omniPath.line(to: nextPoint)
            
        }

        let axisColor = NSColor(hue: 0.5, saturation: 0.8, brightness: 0.71, alpha: 1)
        axisColor.setStroke()
        omniPath.lineWidth = 2
        omniPath.stroke()
        
        
        
        // Drawing code here.
    }
    
}
