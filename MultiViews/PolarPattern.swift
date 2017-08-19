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
    var rawSensitivityValues = [Float](repeating: 0.0, count: 360) // based on micGain = 1 , and micOrientation  = 0 degrees
    var sensitivityValues = [Float](repeating: 0.0, count: 360)  //current values reflecting gain and orientation varaibles
    
    
    //microphone methods
    
    init( pressureOp: Float, pressureGrad: Float, gain: Float, orientation: Int )   {
        
        
        pressureComponent = pressureOp
        pressureGradientComponent = pressureGrad
        micGain = gain
        micOrientationAngle = orientation
        
     //calculate raw sensitivity values and load up array for further use

        for i in 0...359 {
        
            let radianValue: Float = i.degreesToRadians
            rawSensitivityValues[i] = (pressureOp + (cos(radianValue) * pressureGrad)) 
        }
    
        
        let multiplier = micGain 
        
        for i in 0...rawSensitivityValues.count - 1{
            sensitivityValues[i] = rawSensitivityValues[i] * multiplier
        }
        
        let slice1: ArraySlice<Float> = sensitivityValues [micOrientationAngle ... 359]
        let slice2: ArraySlice<Float> = sensitivityValues [ 0 ..< micOrientationAngle]
        
        
        sensitivityValues.removeAll(keepingCapacity: true)
        let tempArray:ArraySlice = slice1 + slice2
        sensitivityValues = Array(tempArray)
        
    }
    
    
    
}


extension Int {
    var degreesToRadians: Float { return Float(self) * .pi / 180 }
}


//let values = [20, 2, 3]
//let doubles = values.map { $0 * 2 }
//let triples = values.map { $0 * 3
