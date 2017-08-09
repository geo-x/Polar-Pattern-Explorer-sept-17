//
//  ViewController.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa



class ViewController: NSViewController {
    @IBOutlet weak var Veiw_1_xib: View_1!  // notice that the outlet makes this xib element a sub of View_1

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view.
    }

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
        Veiw_1_xib.setNeedsDisplay(Veiw_1_xib.bounds)
            }
}

