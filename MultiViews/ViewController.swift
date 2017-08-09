//
//  ViewController.swift
//  MultiViews
//
//  Created by george on 9/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var Veiw_1_xib: NSView!

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
}

