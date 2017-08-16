//
//  ViewController.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

 var omni: PolarPattern = PolarPattern(pressureOp: 0.0, pressureGrad: 1.0, gain: 1, orientation: 0)

class ViewController: NSViewController {
    @IBOutlet weak var cartesianView: CartesianView!

    @IBOutlet weak var polarView: PolarView!
    
       override func viewDidLoad() {
        super.viewDidLoad()
       

        //print(omni.sensitivityValues)
    
       
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
        
        let slice1: ArraySlice<Float> = omni.rawSensitivityValues [omni.micOrientationAngle ... 359]
        let slice2: ArraySlice<Float> = omni.rawSensitivityValues [ 0 ..< omni.micOrientationAngle]
        
        
        omni.sensitivityValues.removeAll(keepingCapacity: true)
         omni.sensitivityValues = Array(slice1 + slice2)
        

        cartesianView.setNeedsDisplay(cartesianView.bounds)
        polarView.setNeedsDisplay(polarView.bounds)
        
        Swift.print(" omni orientation slider = \(sender.floatValue)")
        Swift.print(" omni.micOrientationAngle is \(omni.micOrientationAngle)")
            }
}

