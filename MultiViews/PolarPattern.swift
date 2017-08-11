//
//  PolarPattern.swift
//  MultiViews
//
//  Created by george on 11/8/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

class PolarPattern: NSObject {

    //microphone properties
    
    var pressureGradientComponent: Float
    var pressureComponent : Float
    var micGain:Float
    var micOrientationAngle:Int
    var sensitivityValues = [Float](repeating: 0.0, count: 360)
    
    //microphone methods
    
    init( pressureOp: Float, pressureGrad: Float, gain: Float, orientation: Int )   {
        
        
        pressureComponent = pressureOp
        pressureGradientComponent = pressureGrad
        micGain = gain
        micOrientationAngle = orientation
        
     //calculate sensitivity values and load up array for further use

        for i in 0...359 {
        
            let radianValue: Float = i.degreesToRadians
            sensitivityValues[i] = (pressureOp + (cos(radianValue) * pressureGrad)) * gain
        }
    
    
        
        
    }
    
    
    
}


extension Int {
    var degreesToRadians: Float { return Float(self) * .pi / 180 }
}

