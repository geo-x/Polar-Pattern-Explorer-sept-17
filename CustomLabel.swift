//
//  CustomLabel.swift
//  MultiViews
//
//  Created by george on 28/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa


open class CustomLabel : NSTextField {
    
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.stringValue)
            attributedString.addAttribute(NSKernAttributeName, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length - 1))
            
            self.attributedStringValue = attributedString
            
        }
        
    }
    
  
    
    
    
    
}
