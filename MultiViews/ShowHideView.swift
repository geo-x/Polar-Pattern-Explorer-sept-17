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


//let omniSwitchRect:NSRect = NSRect(x: 30, y: 200, width: 15, height: 15)


class ShowHideView: NSView {
    
let omniSwitchRect:NSRect = NSRect(x: 30, y: 200, width: 15, height: 15)
let biSwitchRect:NSRect = NSRect(x: 30, y: 160, width: 15, height: 15)
    
    
    override func mouseDown(with event: NSEvent) {
        Swift.print("mouse down")
        
        
       
        
        
        let mouseLocation = convert(event.locationInWindow, to: self)
        if NSMouseInRect(mouseLocation, convert(omniSwitchRect, to: self.superview), true) {
            
            
            if omniState == 1{ omniState = 0} else { omniState = 1}
            Swift.print(" triggered inside omni rect - switched omniState Value to \(omniState)")
        
        
        } //end omniState if
        
        
      
        if NSMouseInRect(mouseLocation, convert(biSwitchRect, to: self.superview), true) {
            
            if biState == 1{ biState = 0} else { biState = 1}
            Swift.print("inside bi rect")
        
        } //end biState if

        

        
//        switch omniState {
//        case 1: omniState = 0
//            Swift.print("set to lo")
//   
//        case 0: omniState = 1
//        
//        default: omniState = 1
//        }
               self.setNeedsDisplay(self.bounds)
      NotificationCenter.default.post(name: NSNotification.Name("hideShowNotification"), object: nil)
        
    } //end mouseDown

    
    
    
    
    
    override func draw(_ dirtyRect: NSRect) {
        

        
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

        
      

        // Drawing code here.
    }
    
    
  
    
}





