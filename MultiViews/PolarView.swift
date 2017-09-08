//
//  PolarView.swift
//  MultiViews
//
//  Created by george on 14/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa
var scaleFactor:Int = 150

@IBDesignable

class PolarView: NSView {
    
    

    var startAngle:Float = omni.micOrientationAngle.degreesToRadians
    
    

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
       
        
        let omniPath = NSBezierPath()
        let omniPoints = NSPointArray.allocate(capacity: 360)
        
     
        for i in stride(from: 0, through: 359, by: 1){
        
            let radianValue: Float = i.degreesToRadians
            let thisOmniArrayValue = CGFloat(abs((omni.sensitivityValues [i]) as Float))
            
        omniPoints [i].x = CGFloat(CGFloat(scaleFactor) * thisOmniArrayValue ) * CGFloat(sin(radianValue))
        omniPoints [i].y = CGFloat(CGFloat(scaleFactor) * thisOmniArrayValue ) * CGFloat(cos(radianValue))
        
        } // end for loop
        
       omniPath.appendPoints(omniPoints, count: 360)  // an array of points for polar diagram
    
        //*************** translate path to correct to center of view **********************
        let transform = NSAffineTransform()
        transform.translateX(by: self.bounds.width / 2, yBy: self.bounds.height / 2)
        omniPath.transform(using: transform as AffineTransform)
        
        
        

        
        omniColor.setStroke()
        omniPath.lineWidth = 2
        omniPath.stroke()
        
        
        
        // Drawing code here.
    }
    
}
