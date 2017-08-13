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
    @IBOutlet weak var Veiw_1_xib: OmniView_1!  // notice that the outlet makes this xib element a sub of View_1

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
        
        Veiw_1_xib.setNeedsDisplay(Veiw_1_xib.bounds) //see print statement in draw rect
    }
    
    
    @IBAction func viewOneLineEnd(_ sender: NSSlider) {
        
        Veiw_1_xib.endPoint = CGFloat(sender.floatValue)
         Swift.print(sender.floatValue)
        Veiw_1_xib.setNeedsDisplay(Veiw_1_xib.bounds)
            }
}

