//
//  ViewController.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
// ******

import Cocoa
import AppKit





var radioButtonPressed: Bool = true

var showToolTips = true

 //Create PolarPattern instances - omni, bidirectional, resultant
 var omni: PolarPattern = PolarPattern(pressureOp: 1.0, pressureGrad: 0, gain: 0.5, orientation: 0)
 var biDirectional: PolarPattern = PolarPattern(pressureOp: 0.0, pressureGrad: 1.0, gain: 0.5, orientation: 0)



class ViewController: NSViewController {
    
    
    
    
    
    //Text stuff
    @IBOutlet weak var symbolDescriptions: NSTextField!
  
    
    
    // View Outlets
    @IBOutlet weak var cartesianView: CartesianView!
        
    
    @IBOutlet weak var cartesianViewRes: CartesianViewRes!
    @IBOutlet weak var cartesianDragView: CartesianDrag!
    
   
    @IBOutlet weak var cartesianViewBi: CartesianViewBi!
    @IBOutlet weak var presetPointerView: PresetPointerView!

    @IBOutlet weak var polarView: PolarView!
    @IBOutlet weak var polarViewBi: PolarViewBi!
    @IBOutlet weak var polarViewRes: PolarViewRes!
    @IBOutlet weak var polarDragView: PolarDragView!
    @IBOutlet weak var omniAxisPointerView: OmniAxisPointer!
    
   
    
    
    @IBOutlet weak var showHideView: ShowHideView!
    
    
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
    
    
    // Fader Label Outlets
    @IBOutlet weak var omniFaderLabel: NSTextField!
    @IBOutlet weak var biFaderLabel: NSTextField!
    
    @IBOutlet weak var omniOrientationLabel: NSTextField!
    @IBOutlet weak var biOrientationLabel: NSTextField!
    
    
    // Equation Fields
    @IBOutlet weak var PcomponentLabel: NSTextField!
    @IBOutlet weak var GcomponentLabel: NSTextField!
    @IBOutlet weak var angleLabel: NSTextField!
    @IBOutlet weak var resultLabel: NSTextField!
    
    
   
    
    
    // cartesian grid labels
    @IBOutlet weak var sensitivityAxis: NSTextField! //this one has outlet so it can rotated vertically (cartesian sensitivity)
    
   
 
    
    func controlVis() {
        //Swift.print("executing selector omniState is \(omniState)")
        
        if omniState == 0{ cartesianView.isHidden = true} else { cartesianView.isHidden = false}
        if omniState == 0{ polarView.isHidden = true} else { polarView.isHidden = false}
        
        if biState == 0{ cartesianViewBi.isHidden = true} else { cartesianViewBi.isHidden = false}
        if biState == 0{ polarViewBi.isHidden = true} else { polarViewBi.isHidden = false}
       
        if resultState == 0{ cartesianViewRes.isHidden = true} else { cartesianViewRes.isHidden = false}
        if resultState == 0{ polarViewRes.isHidden = true} else { polarViewRes.isHidden = false}

        
    }
    
   
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.layer?.backgroundColor = NSColor.white.cgColor   //window background color
        
        let win = NSWindow(contentRect: NSMakeRect(100, 100, 600, 200),
                           styleMask: NSResizableWindowMask,
                           backing: NSBackingStoreType.buffered, defer: false)
        
        win.makeKeyAndOrderFront(win)
        let controller = NSWindowController(window: win)
        controller.showWindow(self)
        
        
        
        
      
        if showToolTips == false{
        for subview in self.view.subviews {
            
            subview.removeAllToolTips()
            
        }
    } //end if
        
        
        
         //**********************************************************************************************
        //********** show hide notification handlers ****************************************************
        //***********************************************************************************************
        
    
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.controlVis), name: NSNotification.Name("hideShowNotification"), object: nil)
      
        controlVis()

        
        
        //**********************************************************************************************
        //********** text formatting *******************************************************************
        //**********************************************************************************************
    
        
        let symbolLabelAtrributed = NSMutableAttributedString(string: "where:- \n S = Sensitivity \n P = Pressure operated component\n G = Pressure gradient component\n ⍺ = Angle of arrival")
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 1 // Whatever line spacing you want in points
        //paragraphStyle.minimumLineHeight = 1
        paragraphStyle.maximumLineHeight = 10
        
        // *** Apply attribute to string ***
        symbolLabelAtrributed.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, symbolLabelAtrributed.length))
        symbolLabelAtrributed.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, symbolLabelAtrributed.length))
        
        
        symbolLabelAtrributed.addAttribute(NSKernAttributeName, value: 1, range: NSRange(location: 0, length: symbolLabelAtrributed.length - 1))

        
        // *** Set Attributed String to your label ***
        symbolDescriptions.attributedStringValue =  symbolLabelAtrributed
        
        //**********************************************************************************************
        //**********************************************************************************************
        //**********************************************************************************************
        
        
      
        //**********************************************************************************************
        //******** Rotated Text Labels  ****************************************************************
        //**********************************************************************************************
        
        sensitivityAxis.frameRotation = 90
        // remember set labels to CustomLabel() in xib for @IBDesignable kerning / spacing attribute
        
     
        
        //**********************************************************************************************
        //****** Set up Property Observer  *************************************************************
        //**********************************************************************************************
        
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue:"orientBiNotification"), object: nil, queue: nil) {notification in
            //Swift.print("notified")
       
            
            
            
            
            let resultFormatter = NumberFormatter()
            resultFormatter.minimumIntegerDigits = 1
            resultFormatter.maximumFractionDigits = 2
            
            let resultForLabel = resultFormatter.string(from:NSNumber(value: resultantArray[Int(self.angleLabel.stringValue)!] ))

            self.resultLabel.stringValue = resultForLabel!
            
            
            
            //self.resultLabel.stringValue = String(resultantArray[Int(biDirectional.micOrientationAngle)])
        }
        
        
       //**********************************************************************************************
       //*********************************************************************************************
       
    }
//x-x-x--x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


  
    //**********************************************************************************************
    //********** ACTIONS ***************************************************************************
    //**********************************************************************************************
    
    //**********************************************************************************************
    //************** omni oreintation slider********************************************************
    
    @IBAction func mic_1_orientation(_ sender: NSSlider) {
        
        
       
        
        //omni.micOrientationAngle = Int(Float(sender.maxValue) - sender.floatValue)
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
        
        omniAngle = sender.floatValue
//Swift.print("omni angle from slider= \(omniAngle)")
        
        omniAxisPointerView.setNeedsDisplay(omniAxisPointerView.bounds)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        //formatter.minimumFractionDigits = 2
        formatter.minimumIntegerDigits = 1
        formatter.roundingMode = .down
        
        let omniOrientationFaderLabel = formatter.string(from: NSNumber(value: sender.floatValue))
        
        
        omniOrientationLabel.stringValue = omniOrientationFaderLabel!
       

        
        
    }
    
    //**********************************************************************************************
    //************** biOreintation slider***********************************************************

    @IBAction func mic_2_orientation(_ sender: NSSlider) {
        
        
            biDirectional.micOrientationAngle = Int(sender.floatValue)
        
        if biDirectional.micOrientationAngle == 0 { biDirectional.micOrientationAngle = 0}
        else {
        
           biDirectional.micOrientationAngle = Int(360 - Int(sender.floatValue))
        }
        
            let slice1: ArraySlice<Float> = biDirectional.rawSensitivityValues [biDirectional.micOrientationAngle ... 359]
            let slice2: ArraySlice<Float> = biDirectional.rawSensitivityValues [ 0 ..< biDirectional.micOrientationAngle]
        
        
//        Swift.print(" sender angle is INT------------ \(Int(sender.floatValue))")
//        Swift.print(" sender angle is Float------------ \(sender.floatValue)")
//        Swift.print(" reversed angle is------------ \(biDirectional.micOrientationAngle)")
//
//        Swift.print(" slice 1 count \(slice1.count)")
//        Swift.print(" slice 2 count \(slice2.count)")
        
//        Swift.print("slice 1 \(slice1)")
//        Swift.print("slice 2 \(slice2)")
        
            biDirectional.sensitivityValues.removeAll(keepingCapacity: true)
            biDirectional.sensitivityValues = Array(slice1 + slice2)
            biDirectional.sensitivityValues = biDirectional.sensitivityValues.map { $0 * biDirectional.micGain }
        
//    for i in 1...359 {
//        
//        
//        Swift.print(" array index \(i) =  \(biDirectional.sensitivityValues[i])")
//        
//        }
        
            cartesianViewBi.setNeedsDisplay(cartesianView.bounds)
            polarViewBi.setNeedsDisplay(polarView.bounds)
            cartesianViewRes.setNeedsDisplay(cartesianViewRes.bounds)
            polarViewRes.setNeedsDisplay(polarViewRes.bounds)
        
            biAngle = sender.floatValue
            omniAxisPointerView.setNeedsDisplay(omniAxisPointerView.bounds) //this uses same view as omni angle pointer
        
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 0
            formatter.minimumIntegerDigits = 1
            formatter.roundingMode = .down
        
            let biOrientationFaderLabel = formatter.string(from: NSNumber(value: sender.floatValue))
        
        
            biOrientationLabel.stringValue = biOrientationFaderLabel!
        
             }
 
    
    //**********************************************************************************************
    //************** Preset Radio Buttons **********************************************************
    
    @IBAction func radioPatternSelected(_ sender: NSButton) {
        
        radioButtonPressed = true
        
        omniComponentSliderOut.floatValue = Float(sender.identifier!)!
        omniComponentSlider(omniComponentSliderOut)  //code is same for  both sliders so programatically trigger the other sliders action : )


        //if sender.state == 0 { sender.state = 0} else { sender.state = 1}
        
        
        
        //print(Float(sender.identifier!)!)
    }
    
    //**********************************************************************************************
    //************** Omni + Bi Sliders **********************************************************
    
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
        formatter.roundingMode = .up
        
        let omniLabel = formatter.string(from: NSNumber(value: omni.micGain))
        let biLabel = formatter.string(from: NSNumber(value: biDirectional.micGain))
        
        omniFaderLabel.stringValue = omniLabel!
        biFaderLabel.stringValue = biLabel!
        PcomponentLabel.stringValue = omniLabel!
        GcomponentLabel.stringValue = biLabel!
        
        
        
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
    
    
    //**********************************************************************************************
    
    @IBAction func biComponentSlider(_ sender: NSSlider) {
        
        biDirectional.micGain =  sender.floatValue
        omni.micGain = 1.0 - biDirectional.micGain
        omniComponentSliderOut.floatValue = omni.micGain
        omniComponentSlider(omniComponentSliderOut)  //code is same for  both sliders so programatically trigger the other sliders action : )
        
    }
  
    //**********************************************************************************************
    //******************** Angle Text Input ********************************************************

    
    @IBAction func angleInputText(_ sender: NSTextField) {
        
        guard (sender.floatValue) >= 0 && (sender.floatValue)<360  else{
            //Swift.print( "the text entry holds \(sender.floatValue)")
          alertUser(theView: polarView )
            return
        }
        
        //Swift.print(sender.stringValue)
        //Swift.print(testShapeLayer.position.x)
        testShapeLayer.position.x = CGFloat(sender.floatValue)
        rotationAngle = sender.floatValue
        
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.maximumFractionDigits = 0
        
        let angleForLabel = formatter.string(from:(sender.floatValue as NSNumber))
        
        angleLabel.stringValue = angleForLabel!
        
        
        let resultFormatter = NumberFormatter()
        resultFormatter.minimumIntegerDigits = 1
        resultFormatter.maximumFractionDigits = 2
        
        let resultForLabel = resultFormatter.string(from:NSNumber(value: resultantArray[Int(sender.floatValue)] ))
        resultLabel.stringValue = resultForLabel!
       
      

        
        polarDragView.setNeedsDisplay(polarDragView.bounds)
            
        
    }
    
    
   
    
}//end viewcontroller class


func alertUser(theView: PolarView) {
    let alert = NSAlert()
    
    alert.messageText = "please try a value between 0 and 359"
    alert.informativeText = "keep it real brother!"
    //alert.informativeText = "info2"
    //alert.addButton(withTitle: "NO")
    alert.addButton(withTitle: "OK")
    alert.beginSheetModal(for: theView.window!) { (returnCode: NSModalResponse) -> Void in
        //print ("returnCode: ", returnCode)
        
}
    
   
    
    
}

