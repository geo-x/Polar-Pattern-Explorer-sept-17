//
//  PolarViewBi.swift
//  MultiViews
//
//  Created by george on 18/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa



@IBDesignable


class PolarViewBi: NSView {

    var startAngle:Float = omni.micOrientationAngle.degreesToRadians
    
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        
        
        
        let biDirectionalPath = NSBezierPath()
        let biPoints = NSPointArray.allocate(capacity: 360)
        
        
        for i in stride(from: 0, through: 359, by: 1){
            
            let radianValue: Float = i.degreesToRadians
            let thisBiDirectionalArrayValue = CGFloat(abs((biDirectional.sensitivityValues [i]) as Float))

            
            biPoints [i].x = CGFloat(CGFloat(scaleFactor) * thisBiDirectionalArrayValue ) * CGFloat(sin(radianValue))
            biPoints [i].y = CGFloat(CGFloat(scaleFactor) * thisBiDirectionalArrayValue ) * CGFloat(cos(radianValue))
            
            
        } //end for loop
        
        
         biDirectionalPath.appendPoints(biPoints, count: 360)  // an array of points for polar diagram
        
        //*************** translate path to correct to center of view **********************
        let transform = NSAffineTransform()
        transform.translateX(by: self.bounds.width / 2, yBy: self.bounds.height / 2)
        biDirectionalPath.transform(using: transform as AffineTransform)
  
 
        

        
        biDirectionalColor.setStroke()
        biDirectionalPath.lineWidth = 2
        biDirectionalPath.stroke()
        
        for i in stride(from: 0, through: 359, by: 1){
// Swift.print("point \(i) \(biPoints[i])")
        }
      
        // Drawing code here.
    }
    
}
