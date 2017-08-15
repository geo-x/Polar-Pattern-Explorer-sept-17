//
//  ViewController.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

 var omni: PolarPattern = PolarPattern(pressureOp: 0.5, pressureGrad: 0.5, gain: 1, orientation: 0)

class ViewController: NSViewController {
    @IBOutlet weak var cartesianView: CartesianView!

    @IBOutlet weak var polarView: PolarView!
    
       override func viewDidLoad() {
        super.viewDidLoad()
       

        print(omni.sensitivityValues)
    
       
    }
//x-x-x--x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func testView1(_ sender: NSButton) {
        
        cartesianView.setNeedsDisplay(cartesianView.bounds) //see print statement in draw rect
    }
    
    
    @IBAction func viewOneLineEnd(_ sender: NSSlider) {
        
        omni.micOrientationAngle = Int(sender.floatValue)
        
        let slice1: ArraySlice<Float> = omni.sensitivityValues [omni.micOrientationAngle ... 359]
        let slice2: ArraySlice<Float> = omni.sensitivityValues [ 0 ..< omni.micOrientationAngle]
        
        
        omni.sensitivityValues.removeAll(keepingCapacity: true)
        var tempArray:ArraySlice = slice1 + slice2
        omni.sensitivityValues = Array(tempArray)
        
        
        
         Swift.print(sender.floatValue)
        cartesianView.setNeedsDisplay(cartesianView.bounds)
        polarView.setNeedsDisplay(polarView.bounds)
            }
}

//omni.micOrientationAngle = CGFloat(sender.floatValue)
//Swift.print(sender.floatValue)
//cartesianView.setNeedsDisplay(cartesianView.bounds)


//var valuesTempArray = omni.sensitivityValues
//
//var jCounter:Int = 0
//
//for i in omni.micOrientationAngle ... 359 {
//    valuesTempArray[jCounter] = omni.sensitivityValues[i]
//    jCounter = jCounter + 1
//}
//
//
//for i in 0 ... omni.micOrientationAngle + 1 {
//    valuesTempArray[jCounter] = omni.sensitivityValues[i]
//    jCounter = jCounter + 1
//}
//jCounter = 0
//
//omni.sensitivityValues = valuesTempArray
//Swift.print(" valuesTempArray = \(valuesTempArray)")
