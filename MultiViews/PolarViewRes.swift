//
//  PolarViewRes.swift
//  MultiViews
//
//  Created by george on 18/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa


@IBDesignable

class PolarViewRes: NSView {

    //var startAngle:Float = omni.micOrientationAngle.degreesToRadians
    
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let resultantPath = NSBezierPath()
        let resultantPoints = NSPointArray.allocate(capacity: 360)
        
        //************************************************************************
        //******** make resultantArray from omni and bi patterns  ****************
        
        var resultantArray: Array = [Float](repeating: 0.0, count: 360)
        
        for i in 0...359{
            
            resultantArray[i] = omni.sensitivityValues[i] + biDirectional.sensitivityValues [i]
            
        }
        
        //************************************************************************
        //**************  create array of points for drawing *********************
        
        for i in stride(from: 0, through: 359, by: 1){
            
            let radianValue: Float = i.degreesToRadians
            let thisResultantArrayValue = CGFloat(abs((resultantArray [i]) as Float))
            
            
            resultantPoints [i].x = CGFloat(CGFloat(scaleFactor) * abs(thisResultantArrayValue) ) * CGFloat(sin(radianValue))
            resultantPoints [i].y = CGFloat(CGFloat(scaleFactor) * abs(thisResultantArrayValue) ) * CGFloat(cos(radianValue))
            
            
        } //end for loop
        
        
        //************************************************************************
        //**************  load array points into path ****************************
        
        resultantPath.appendPoints(resultantPoints, count: 360)  // an array of points for polar diagram
        //************************************************************************
        //*************** translate path to correct to center of view ************
        let transform = NSAffineTransform()
        transform.translateX(by: self.bounds.width / 2, yBy: self.bounds.height / 2)
        resultantPath.transform(using: transform as AffineTransform)
 
        resultantPath.close()
        //************************************************************************
        //*************** stroke the path ****************************************
        
        resultantlColor.setStroke()
        resultantlColorFill.setFill()
        resultantPath.lineWidth = 2
        resultantPath.stroke()
        resultantPath.fill()
        
        // round the view corners of view
        self.layer?.cornerRadius = 15
        
        
        
        // Drawing code here.
    } //end draw rect
    
}
