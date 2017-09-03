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


let omniSwitchRect:NSRect = NSRect(x: 30, y: 200, width: 15, height: 15)
let biSwitchRect:NSRect = NSRect(x: 30, y: 160, width: 15, height: 15)

class ShowHideView: NSView {
    
  
    
    
    override func mouseDown(with event: NSEvent) {
        Swift.print("mouse down")
        
        if omniSwitchRect.contains(convert(event.locationInWindow, to: self)) { Swift.print("inside rect")}
        Swift.print(convert(event.locationInWindow, to: self))
        Swift.print(" unconverted \(event.locationInWindow)")
        
        //convertPoint(touch.location(in: self))  /event.locationInWindow
        
        switch omniState {
        case 1: omniState = 0
            Swift.print("set to lo")
   
        case 0: omniState = 1
        
        default: omniState = 1
        }
               self.setNeedsDisplay(self.bounds)
      NotificationCenter.default.post(name: NSNotification.Name("hideShowNotification"), object: nil)
        
    } //end mouseDown

    
    
    
    
    
    override func draw(_ dirtyRect: NSRect) {
        

        drawSelectionBoxes()
        
      

        // Drawing code here.
    }
    
    
  
    
}

func drawSelectionBoxes() {
    
    
    Swift.print("redraw called")

    
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
    
    
}




