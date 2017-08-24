//
//  CartesianDrag.swift
//  MultiViews
//
//  Created by george on 21/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

//@IBDesignable




var mouseStartPoint: CGPoint = CGPoint(x: 0, y: 0)

class CartesianDrag: NSView {
    
    
   
    
//    override func mouseDown(with event: NSEvent){
//        
//        mouseStartPoint = event.locationInWindow
// 
//    }
//    
//
//
//       override func mouseDragged(with event: NSEvent){
//        
//        var pointInView = event.locationInWindow
//        
//        
//       //layer?.frame = NSOffsetRect((layer?.frame)!, pointInView.x, 0)
//        
//        layer?.position = NSPoint(x: (layer?.position.x)! + mouseStartPoint.x - pointInView.x, y: 300.0)
//        //Swift.print(pointInView.x)
//    }
//   
    
    let cursorShape = NSBezierPath()
    var dragCircle = NSBezierPath()
    
//    override func awakeFromNib() {
//        wantsLayer = true
//    }
    
   
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        Swift.print(self)
        
        
       let testShapeLayer = CAShapeLayer()
        
        // The Bezier path that we made needs to be converted to
        // a CGPath before it can be used on a layer.
        
        // note uses extension below to convert NSBesier to GCPath
       testShapeLayer.path = createBezierPath().CGPath
        
       
        
        // apply  properties related to the path
        testShapeLayer.strokeColor = NSColor.red.cgColor
        testShapeLayer.fillColor = NSColor.white.cgColor
        testShapeLayer.lineWidth = 2.0
        testShapeLayer.position = CGPoint(x: 0, y: 0)
        
         self.layer?.addSublayer(testShapeLayer)
        
        
        
//        
//        
//        let myLayer = CALayer()
//        myLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
//        myLayer.backgroundColor = NSColor.blue.cgColor
//        //myLayer.string = "Hello"
//        self.layer?.addSublayer(myLayer)
//        
//        
//        
//
//       
//        
//        
//
//        cursorColor.setStroke()
//        cursorColor.setFill()
//      
//       let shapePath = createBezierPath()
//       shapePath.lineWidth = 2
//       shapePath.stroke()
//       shapePath.fill()
        
        // Drawing code here.
        
        
     

        
    }
   
    func createBezierPath() -> NSBezierPath {
       
        // create a new path
        let cursor = NSBezierPath()
       
        
        // starting point for the path (bottom left)
        let bottomStartPoint = CGPoint(x: 20, y: 35)
        
        
        cursor.move(to: bottomStartPoint)
        
        // **************************
        // ***** cursor line ********
        // **************************
        
        // segment 1: line
        let topLinePoint = CGPoint(x: 20, y: 350)
        cursor.line(to: topLinePoint)
        
        // *****************************
        // ***** drag circle shape *****
        // *****************************

        
        let dragCircle = NSBezierPath()
        let circleDiameter:CGFloat = 10
        dragCircle.appendOval(in: NSRect(origin: CGPoint(x: (topLinePoint.x - circleDiameter/2), y: topLinePoint.y  ), size: CGSize(width: circleDiameter, height: circleDiameter)))
        
        //add circle and line to make one NSBezierPath
        cursor.append(dragCircle)

        
        return cursor
    }
    
    

}




public extension NSBezierPath
{
    public var CGPath: CGPath
    {
        let path = CGMutablePath()
        var points = [CGPoint](repeating: .zero, count: 3)
        for i in 0 ..< self.elementCount {
            let type = self.element(at: i, associatedPoints: &points)
            switch type {
            case .moveToBezierPathElement: path.move(to: CGPoint(x: points[0].x, y: points[0].y) )
            case .lineToBezierPathElement: path.addLine(to: CGPoint(x: points[0].x, y: points[0].y) )
            case .curveToBezierPathElement: path.addCurve(      to: CGPoint(x: points[2].x, y: points[2].y),
                                                                control1: CGPoint(x: points[0].x, y: points[0].y),
                                                                control2: CGPoint(x: points[1].x, y: points[1].y) )
            case .closePathBezierPathElement: path.closeSubpath()
            }
        }
        return path
    }
}

//@IBAction func dragCartesianAngle(_ sender: NSPanGestureRecognizer) {
//
//    Swift.print("dragging")
//
//    let t = sender.translation(in: cartesianDragView)
//    sender.view?.frame = NSOffsetRect((sender.view?.frame)!, t.x, 0)
//    sender.setTranslation(NSZeroPoint, in: nil)
//    Swift.print(t.x)
//
//
//}
