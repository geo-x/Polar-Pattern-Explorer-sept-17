//
//  ViewController.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa







var radioButtonPressed: Bool = true

 //Create PolarPattern instances - omni, bidirectional, resultant
 var omni: PolarPattern = PolarPattern(pressureOp: 1.0, pressureGrad: 0, gain: 0.5, orientation: 0)
 var biDirectional: PolarPattern = PolarPattern(pressureOp: 0.0, pressureGrad: 1.0, gain: 0.5, orientation: 0)






class ViewController: NSViewController {
    
    
   
    
    
    
    
    
    // View Outlets
    @IBOutlet weak var cartesianView: CartesianView!
    @IBOutlet weak var cartesianViewBi: cartesianViewBi!
    @IBOutlet weak var cartesianViewRes: CartesianViewRes!
    @IBOutlet weak var cartesianDragView: CartesianDrag!
    
    @IBOutlet weak var presetPointerView: PresetPointerView!

    @IBOutlet weak var polarView: PolarView!
    @IBOutlet weak var polarViewBi: PolarViewBi!
    @IBOutlet weak var polarViewRes: PolarViewRes!
    @IBOutlet weak var polarDragView: PolarDragView!
    
    
    
    // Slider outlets  - to update slider positions
    @IBOutlet weak var omniComponentSliderOut: NSSlider!
    @IBOutlet weak var biComponentSliderOut: NSSlider!
    
    //Radio Button Outlets
    @IBOutlet weak var omniRadio: NSButton!
    @IBOutlet weak var subRadio: NSButton!
    @IBOutlet weak var cardRadio: NSButton!
    @IBOutlet weak var superRadio: NSButton!
    @IBOutlet weak var hyperRadio: NSButton!
    @IBOutlet weak var biRadio: NSButton!
    
    
    // Label Outlets
    @IBOutlet weak var omniFaderLabel: NSTextField!
    @IBOutlet weak var biFaderLabel: NSTextField!
    
    
    
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
       //view.window?.makeFirstResponder(self)  // Harry Ng day 43 video

//print(omni.sensitivityValues)
    
       
    }
//x-x-x--x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


  
    //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    //XXXXXXXXXXXXX   Actions    XXXXXXXXXXXXXXXXX
    //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    
    
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
        //Swift.print(biDirectional.micOrientationAngle.didSet)
    }
    
//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

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
 
    
    //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
    //x-x-x-x-x-x- Preset Radio Buttons x-x-x-x-x-x-x-x-x-x-x
    
    @IBAction func radioPatternSelected(_ sender: NSButton) {
        
        radioButtonPressed = true
        
        omniComponentSliderOut.floatValue = Float(sender.identifier!)!
        omniComponentSlider(omniComponentSliderOut)  //code is same for  both sliders so programatically trigger the other sliders action : )


        //if sender.state == 0 { sender.state = 0} else { sender.state = 1}
        
        
        
        print(Float(sender.identifier!)!)
    }
    
    //x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
    //x-x-x-x-x  Omni and Bi Sliders  x-x-x-x-x-x-x-x-x-x-x-x
    
    @IBAction func omniComponentSlider(_ sender: NSSlider) {
        
        
      pointerFeedback = CGFloat(sender.floatValue)
        
        
        
        if radioButtonPressed == false {
            omniRadio.state = 0
            subRadio.state = 0
            cardRadio.state = 0
            superRadio.state = 0
            hyperRadio.state = 0
            biRadio.state = 0
            
        }
  
        omni.micGain =  sender.floatValue
        biDirectional.micGain = 1.0 - omni.micGain
        biComponentSliderOut.floatValue = biDirectional.micGain
        
        // update labels
        let formatter = NumberFormatter()
       
       
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.minimumIntegerDigits = 1
        formatter.roundingMode = .down
        let omniLabel = formatter.string(from: NSNumber(value: omni.micGain))
        let biLabel = formatter.string(from: NSNumber(value: biDirectional.micGain))
        
        omniFaderLabel.stringValue = omniLabel!
        biFaderLabel.stringValue = biLabel!
     
        //------recalculate arrays-----
        
         //update omni mic values
        
        omni.sensitivityValues = omni.rawSensitivityValues
        
        //adjust omni orientation angle from it's slider
        let slice1: ArraySlice<Float> = omni.rawSensitivityValues [omni.micOrientationAngle ... 359]
        let slice2: ArraySlice<Float> = omni.rawSensitivityValues [ 0 ..< omni.micOrientationAngle]
        
        omni.sensitivityValues.removeAll(keepingCapacity: true)
        omni.sensitivityValues = Array(slice1 + slice2)
        
         //adjust gain from this slider
        omni.sensitivityValues = omni.sensitivityValues.map { $0 * omni.micGain }
        
        //update bidirectional mic values
        
        biDirectional.sensitivityValues =  biDirectional.rawSensitivityValues
        
        //adjust bi orientation angle from it's slider
        let biSlice1: ArraySlice<Float> = biDirectional.rawSensitivityValues [biDirectional.micOrientationAngle ... 359]
        let biSlice2: ArraySlice<Float> = biDirectional.rawSensitivityValues [ 0 ..< biDirectional.micOrientationAngle]
        
        
        biDirectional.sensitivityValues.removeAll(keepingCapacity: true)
        biDirectional.sensitivityValues = Array(biSlice1 + biSlice2)
        
        
         //adjust gain from this slider ...this is derived above
        biDirectional.sensitivityValues = biDirectional.sensitivityValues.map { $0 * biDirectional.micGain}
        
        
        // update the graphs omni, bi, reult for both cartesian and polar
        cartesianView.setNeedsDisplay(cartesianView.bounds)
        polarView.setNeedsDisplay(polarView.bounds)
        cartesianViewRes.setNeedsDisplay(cartesianViewRes.bounds)
        polarViewRes.setNeedsDisplay(polarViewRes.bounds)
        cartesianViewBi.setNeedsDisplay(cartesianViewBi.bounds)
        polarViewBi.setNeedsDisplay(polarViewBi.bounds)
        presetPointerView.setNeedsDisplay(presetPointerView.bounds)
        
        radioButtonPressed = false
    }
    
    
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    
    @IBAction func biComponentSlider(_ sender: NSSlider) {
        
        biDirectional.micGain =  sender.floatValue
        omni.micGain = 1.0 - biDirectional.micGain
        omniComponentSliderOut.floatValue = omni.micGain
        omniComponentSlider(omniComponentSliderOut)  //code is same for  both sliders so programatically trigger the other sliders action : )
        
    }
  
  //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    
//    @IBAction func angleInputText(_ sender: NSTextField) {
//        
//       let alert = NSAlert()
//        alert.messageText = "Angle entered"
//        alert.runModal()
//        
//        Swift.print(sender.stringValue)
//    }
    
    @IBAction func angleInputText(_ sender: NSTextField) {
        Swift.print(sender.stringValue)
        Swift.print(testShapeLayer.position.x)
        testShapeLayer.position.x = CGFloat(sender.floatValue)
        rotationAngle = sender.floatValue
        
        // cartesianDragView doesn't need set needs display call because CALayer is called in this event handler??
        //cartesianDragView.setNeedsDisplay(cartesianDragView.bounds)
        
        polarDragView.setNeedsDisplay(polarDragView.bounds)
    }
    
}



