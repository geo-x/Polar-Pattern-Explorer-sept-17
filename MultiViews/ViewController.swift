//
//  ViewController.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

 //Create PolarPattern instances - omni, bidirectional, resultant
 var omni: PolarPattern = PolarPattern(pressureOp: 0.0, pressureGrad: 1.0, gain: 0.5, orientation: 0)
 var biDirectional: PolarPattern = PolarPattern(pressureOp: 0.0, pressureGrad: 1.0, gain: 0.5, orientation: 0)

class ViewController: NSViewController {
    @IBOutlet weak var cartesianView: CartesianView!
    @IBOutlet weak var cartesianViewBi: cartesianViewBi!
    @IBOutlet weak var cartesianViewRes: CartesianViewRes!
    

    @IBOutlet weak var polarView: PolarView!
    @IBOutlet weak var polarViewBi: PolarViewBi!
    @IBOutlet weak var polarViewRes: PolarViewRes!
    
    
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
    
    @IBAction func mic_1_orientation(_ sender: NSSlider) {
        omni.micOrientationAngle = Int(sender.floatValue)
        
        let slice1: ArraySlice<Float> = omni.rawSensitivityValues [omni.micOrientationAngle ... 359]
        let slice2: ArraySlice<Float> = omni.rawSensitivityValues [ 0 ..< omni.micOrientationAngle]
        
        
        omni.sensitivityValues.removeAll(keepingCapacity: true)
        omni.sensitivityValues = Array(slice1 + slice2)
        omni.sensitivityValues = omni.sensitivityValues.map { $0 * omni.micGain }
        
        cartesianView.setNeedsDisplay(cartesianView.bounds)
        polarView.setNeedsDisplay(polarView.bounds)
        cartesianViewRes.setNeedsDisplay(cartesianViewRes.bounds)
        polarViewRes.setNeedsDisplay(polarViewRes.bounds)
    
    }

    @IBAction func mic_2_orientation(_ sender: NSSlider) {
        
            biDirectional.micOrientationAngle = Int(sender.floatValue)
        
            let slice1: ArraySlice<Float> = biDirectional.rawSensitivityValues [biDirectional.micOrientationAngle ... 359]
            let slice2: ArraySlice<Float> = biDirectional.rawSensitivityValues [ 0 ..< biDirectional.micOrientationAngle]
        
        
            biDirectional.sensitivityValues.removeAll(keepingCapacity: true)
            biDirectional.sensitivityValues = Array(slice1 + slice2)
            biDirectional.sensitivityValues = biDirectional.sensitivityValues.map { $0 * biDirectional.micGain }
        
            cartesianViewBi.setNeedsDisplay(cartesianView.bounds)
            polarViewBi.setNeedsDisplay(polarView.bounds)
            cartesianViewRes.setNeedsDisplay(cartesianViewRes.bounds)
            polarViewRes.setNeedsDisplay(polarViewRes.bounds)
    }
 

    
    
    
}


