//
//  ShowHideView.swift
//  Polar Pattern
//
//  Created by george on 1/9/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa



//*********  Show Hide States ***************
var omniState = 1

var biState = 1

var resultState = 1




@IBDesignable
class ShowHideView: NSView {
    
let omniSwitchRect:NSRect = NSRect(x: 30, y: 200, width: 15, height: 15)
let biSwitchRect:NSRect = NSRect(x: 30, y: 160, width: 15, height: 15)
let resultSwitchRect:NSRect = NSRect(x: 30, y: 120, width: 15, height: 15)
     
    override func mouseDown(with event: NSEvent) {
        //Swift.print("mouse down")
        
        
       
      //***************** check mouse down location ***********************
        
        let mouseLocation = convert(event.locationInWindow, to: self)
        if NSMouseInRect(mouseLocation, convert(omniSwitchRect, to: self.superview), true) {
            
        //*****************  mouse down in omni ***************************
            if omniState == 1{ omniState = 0} else { omniState = 1}
           // Swift.print(" triggered inside omni rect - switched omniState Value to \(omniState)")
        
        
        } //end omniState if
        
        //*****************  mouse down in bi ***************************
      
        if NSMouseInRect(mouseLocation, convert(biSwitchRect, to: self.superview), true) {
            
            if biState == 1{ biState = 0} else { biState = 1}
           // Swift.print("inside bi rect")
        
        } //end biState if

        //*****************  mouse down in result ***************************
        
        if NSMouseInRect(mouseLocation, convert(resultSwitchRect, to: self.superview), true) {
            
            if resultState == 1{ resultState = 0} else { resultState = 1}
            //Swift.print("inside result rect")
            
        } //end resState if

        // refresh view to redraw select rect states
              self.setNeedsDisplay(self.bounds)
       
      // post notification ...goes to
      NotificationCenter.default.post(name: NSNotification.Name("hideShowNotification"), object: nil)
        
    } //end mouseDown

    
    
    
    
    
    override func draw(_ dirtyRect: NSRect) {
        

        //***************************************************************
        //************ draw omni rect select ****************************
        
        omniRect.appendRoundedRect(omniSwitchRect, xRadius: 2, yRadius: 2)
        
        if omniState == 1{
            omniRectHiStroke.setStroke()
            omniRectHiFill.setFill()
            omniRect.lineWidth = 1.0
            omniRect.fill()
            omniRect.stroke()}
        else{
            omniRectHiStroke.setStroke()
            omniRectLoFill.setFill()
            omniRect.lineWidth = 1.0
            omniRect.fill()
            omniRect.stroke()
        }
        
        //***************************************************************
        //************ draw bi rect select ******************************
        
        biRect.appendRoundedRect(biSwitchRect, xRadius: 2, yRadius: 2)
        
        if biState == 1{
            biRectHiStroke.setStroke()
            biRectHiFill.setFill()
            biRect.lineWidth = 1.0
            biRect.fill()
            biRect.stroke()}
        else{
            
            
            biRectHiStroke.setStroke()
            biRectLoFill.setFill()
            biRect.lineWidth = 1.0
            biRect.fill()
            biRect.stroke()
            
        }

        
        //***************************************************************
        //************ draw result rect select **************************
        
        
        resultRect.appendRoundedRect(resultSwitchRect, xRadius: 2, yRadius: 2)
        
        if resultState == 1{
            resRectHiStroke.setStroke()
            resRectHiFill.setFill()
            resultRect.lineWidth = 1.0
            resultRect.fill()
            resultRect.stroke()}
        else{
            
            
            resRectHiStroke.setStroke()
            resRectLoFill.setFill()
            resultRect.lineWidth = 1.0
            resultRect.fill()
            resultRect.stroke()
          
        
        }
        
  
      
    } //end draw method of view
    
    
  
    
}





