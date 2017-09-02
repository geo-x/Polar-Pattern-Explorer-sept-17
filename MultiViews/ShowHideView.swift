//
//  ShowHideView.swift
//  Polar Pattern
//
//  Created by george on 1/9/17.
//  Copyright © 2017 george. All rights reserved.
//

//import Cocoa
//
//
//
//
//let omniRectPosSize:NSRect = NSRect(x: 30, y: 200, width: 15, height: 15)
//let biRectPosSize:NSRect = NSRect(x: 30, y: 160, width: 15, height: 15)
//
//class ShowHideView: NSView {
//    
//    
//    
//    
//    override func mouseDown(with event: NSEvent) {
//        Swift.print("mouse down")
//        
//        
//        switch omniState {
//        case 1: omniState = 0        // this is printed
//   
//        case 0: omniState = 1
//        
//        default: omniState = 1
//        }
//        self.setNeedsDisplay(self.bounds)
//        
//    }
//
//    override func draw(_ dirtyRect: NSRect) {
//    
//        
//       
//        
//        drawSelectionBoxes()
//        
//      
//
//        // Drawing code here.
//    }
//    
//    
//  
//    
//}
//
//func drawSelectionBoxes() {
//    
//    
//    
//    
//    omniRect.appendRoundedRect(omniRectPosSize, xRadius: 2, yRadius: 2)
//    
//    if omniState == 1{
//    omniRectHiStroke.setStroke()
//    omniRectHiFill.setFill()
//    omniRect.lineWidth = 1.0
//    omniRect.fill()
//    omniRect.stroke()}
//    else{
//    omniRectHiStroke.setStroke()
//    omniRectLoFill.setFill()
//    omniRect.lineWidth = 1.0
//    omniRect.fill()
//    omniRect.stroke()
//    }
//   
//    biRect.appendRoundedRect(biRectPosSize, xRadius: 2, yRadius: 2)
//    
//    if biState == 1{
//        biRectHiStroke.setStroke()
//        biRectHiFill.setFill()
//        biRect.lineWidth = 1.0
//        biRect.fill()
//        biRect.stroke()}
//    else{
//        biRectHiStroke.setStroke()
//        biRectLoFill.setFill()
//        biRect.lineWidth = 1.0
//        biRect.fill()
//        biRect.stroke()
//    }
//    
//    
//}
//
//
//
//
