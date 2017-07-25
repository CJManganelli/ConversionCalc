//
//  CalculateConversion.swift
//  ConversionCalc
//
//  Created by Carl Manganelli on 7/24/17.
//  Copyright © 2017 Carl Manganelli. All rights reserved.
//

import Foundation

class CalculateConversion {

    class func toCelcius(_ fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * (5/9)
    }
    
    class func toFahrenheit (_ celcius: Double) -> Double {
        return (celcius * (5/9)) + 32
    }
    
    class func toKilometers (_ miles: Double) -> Double {
        return miles * 1.60934
    }
    
    class func toMiles (_ kilometers: Double) -> Double {
        return kilometers / 1.60934
    }

}
