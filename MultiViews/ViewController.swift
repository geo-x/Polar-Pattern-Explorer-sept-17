//
//  ViewController.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

 let omni: PolarPattern = PolarPattern(pressureOp: 0.5, pressureGrad: 0.5, gain: 1, orientation: 0)

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
        var valuesTempArray = omni.sensitivityValues
        var jCounter:Int = 0
        
        for i in omni.micOrientationAngle ... 359 {
        valuesTempArray[jCounter] = omni.sensitivityValues[i]
        jCounter = jCounter + 1
        }
        
        for i in 0 ... omni.micOrientationAngle - 1 {
            valuesTempArray[jCounter] = omni.sensitivityValues[i]
            jCounter = jCounter + 1
        }
        
        
        omni.sensitivityValues = valuesTempArray
        Swift.print(" valuesTempArray = \(valuesTempArray)")
        
         Swift.print(sender.floatValue)
        cartesianView.setNeedsDisplay(cartesianView.bounds)
        polarView.setNeedsDisplay(polarView.bounds)
            }
}

//omni.micOrientationAngle = CGFloat(sender.floatValue)
//Swift.print(sender.floatValue)
//cartesianView.setNeedsDisplay(cartesianView.bounds)
