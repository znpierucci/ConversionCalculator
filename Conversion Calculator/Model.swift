//
//  File.swift
//  Conversion Calculator
//
//  Created by Zachary Pierucci on 10/10/17.
//  Copyright © 2017 Zachary Pierucci. All rights reserved.
//

import Foundation

class ConversionCalculator {
    var inputValueString = ""
    var input: InputConverter?
    var output: OutputConverter?
    
    
    var inputValue: Double {
        return Double(inputValueString) ?? 0.0
    }
    
    func append(digit: Int) {
        inputValueString += String(digit)
    }
    
    func appendDecimal() {
        guard !inputValueString.contains(".") else { return }
        
        if inputValueString.isEmpty {
            inputValueString += "0."
        } else {
            inputValueString += "."
        }
    }
    
    func clearInput() {
        inputValueString = ""
    }
    
    func back() {
        inputValueString = String(inputValueString[inputValueString.startIndex..<inputValueString.endIndex])
    }
    
    func unitConvert() -> Double {
        let baseValue = input?.convert(inputValue) ?? 0.0
        return output?.convert(baseValue) ?? 0.0
    }
    
    struct InputConverter {
        let inputUnits: String
        let convert: (Double) -> Double
    }
    
    struct OutputConverter {
        let outputUnits: String
        let convert: (Double) -> Double
    }
    
    //DISTANCE UNITS
    //inch
    //foot
    //yard
    //mile
    //millimeter
    //centimeter
    //meter
    //kilometer
    
    let distanceToMeters = [
        InputConverter(inputUnits: "inches", convert: { (input) -> Double in
            return input * 0.0254
        }),
        InputConverter(inputUnits: "feet", convert: { (input) -> Double in
            return input * 0.3048
        }),
        InputConverter(inputUnits: "yards", convert: { (input) -> Double in
            return input * 0.9144
        }),
        InputConverter(inputUnits: "miles", convert: { (input) -> Double in
            return input * 1609.34
        }),
        InputConverter(inputUnits: "millimeters", convert: { (input) -> Double in
            return input * 0.001
        }),
        InputConverter(inputUnits: "centimeters", convert: { (input) -> Double in
            return input * 0.01
        }),
        InputConverter(inputUnits: "meters", convert: { (input) -> Double in
            return input * 1
        }),
        InputConverter(inputUnits: "kilometers", convert: { (input) -> Double in
            return input * 1000
        })
    ]
    
    let distanceFromMeters = [
        OutputConverter(outputUnits: "inches", convert: { (output) -> Double in
            return output / 0.0254
        }),
        OutputConverter(outputUnits: "feet", convert: { (output) -> Double in
            return output / 0.3048
        }),
        OutputConverter(outputUnits: "yards", convert: { (output) -> Double in
            return output / 0.9144
        }),
        OutputConverter(outputUnits: "miles", convert: { (output) -> Double in
            return output / 1609.34
        }),
        OutputConverter(outputUnits: "millimeters", convert: { (output) -> Double in
            return output / 0.001
        }),
        OutputConverter(outputUnits: "centimeters", convert: { (output) -> Double in
            return output / 0.01
        }),
        OutputConverter(outputUnits: "meters", convert: { (output) -> Double in
            return output / 1
        }),
        OutputConverter(outputUnits: "kilometers", convert: { (output) -> Double in
            return output / 1000
        })
    ]
    
    
    //TEMPERATURE UNITS
    //Fahrenheit
    //Calcius
    //Kelvin
    
    let temperatureToFahrenheit = [
        InputConverter(inputUnits: "fahrenheit", convert: { (input) -> Double in
            return input * 1
        }),
        InputConverter(inputUnits: "celcius", convert: { (input) -> Double in
            return input * (9/5) + 32
        }),
        InputConverter(inputUnits: "kelvin", convert: { (input) -> Double in
            return (9/5) * (input - 273) + 32
        })
    ]
    
    let temperatureFromFahrenheit = [
        OutputConverter(outputUnits: "fahrenheit", convert: { (output) -> Double in
            return output * 1
        }),
        OutputConverter(outputUnits: "celcius", convert: { (output) -> Double in
            return output - 32 / (9/5)
        }),
        OutputConverter(outputUnits: "kelvin", convert: { (output) -> Double in
            return output + 459.67 * (5/9)
        })
    ]
    
    //VOLUME UNITS
    //cup
    //pint
    //quart
    //gallon
    //milliliter
    //centiliter
    //decaliter
    //liter
    
    let volumeToLiters = [
        InputConverter(inputUnits: "cups", convert: { (input) -> Double in
            return input * 0.236588
        })
    ]
    
    let volumeFromLiters = [
        OutputConverter(outputUnits: "cups", convert: { (output) -> Double in
            return output / 0.236588
        })
    ]
    
    //WEIGHT UNITS
    //ounce
    //pound
    //ton
    //milligram
    //gram
    //kilogram
    
    let weightToGrams = [
        InputConverter(inputUnits: "ounces", convert: { (input) -> Double in
            return input * 28.3495
        })
    ]
    
    let weightFromGrams = [
        OutputConverter(outputUnits: "ounces", convert: { (output) -> Double in
            return output / 28.3495
        })
    ]
    
}
