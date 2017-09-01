//
//  ShowHideView.swift
//  Polar Pattern
//
//  Created by george on 1/9/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

class ShowHideView: NSView {
    
    


    override func draw(_ dirtyRect: NSRect) {
    
        drawSelectionBoxes()
        
      

        // Drawing code here.
    }
    
}

func drawSelectionBoxes() {
    
    let omniRect = NSBezierPath()
    let biRect = NSBezierPath()
    let resultRect = NSBezierPath()
    
    
    omniRect.appendRoundedRect((NSRect(x:30, y:200, width:15, height:15)), xRadius: 3, yRadius: 3)
    
    omniRectHiStroke.setStroke()
    omniRectLoFill.setFill()
    omniRect.lineWidth = 2.0
    omniRect.fill()
    omniRect.stroke()
    
}
