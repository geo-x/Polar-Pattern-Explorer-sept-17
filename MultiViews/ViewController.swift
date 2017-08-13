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
        
        cartesianView.endPoint = CGFloat(sender.floatValue)
         Swift.print(sender.floatValue)
        cartesianView.setNeedsDisplay(cartesianView.bounds)
            }
}

