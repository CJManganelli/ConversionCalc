//
//  CalculatorViewController.swift
//  ConversionCalc
//
//  Created by Carl Manganelli on 7/24/17.
//  Copyright © 2017 Carl Manganelli. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    
    @IBOutlet weak var inputBox: UITextField!
    @IBOutlet weak var outputBox: UITextField!
    
    
    var isThereADecimal: Bool = false
    
    var unit: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isThereADecimal = false
        inputBox.text = "0.0"
        unit = "celcius"
        update(0.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func numBtnPress(_ sender: UIButton) {
        
        let number = Int(sender.accessibilityLabel!)
        
        if inputBox.text == "0.0" {
            inputBox.text = String(number!)
        }
        else {
            inputBox.text = inputBox.text! + String(number!)
        }
        
        
        //And then update output textfield
        
    }


    @IBAction func decimalBtnPress(_ sender: UIButton) {
        if isThereADecimal == true {
            //isThereADecimal = false
            outputBox.text! = String(isThereADecimal) //for testing as I build
        }
        else if isThereADecimal == false {
            isThereADecimal = true
            inputBox.text = inputBox.text! + "."
            
            outputBox.text! = String(isThereADecimal) // for testing as I build
        }
    }
    
    
    @IBAction func plusMinusBtnPress(_ sender: UIButton) {
        
        if inputBox.text == "" {
            // literally do nothing
        }
        if inputBox.text == "." {
            // still do nothing
        }
        else {
            var number = Double(inputBox.text!)
            number = number! * -1.0
            inputBox.text = String(number!)
            update(number!)
        }
        
        
        //And then update output textfield
        
    }
    
    
    @IBAction func clearBtnPress(_ sender: UIButton) {
        inputBox.text = "0.0"
        isThereADecimal = false
        
        
        // Dev code used for testing as I build //
        //let num = 4.5
        //outputBox.text = String(unit)
        //*************************************///
        
        
        //And then update output textfield
        update(0.0)
    }
    
    
    //Update Function goes here
    
    func update(_ number: Double) {
        //var convertedNum: Double = 0.0
        
        switch unit {
            
            case "fahrenheit":
                let convertedNum = CalculateConversion.toCelcius(number)
                outputBox.text = String(format:"%.2f", convertedNum)
                print(convertedNum)
                print("F")
            
            case "celcius":
                let convertedNum = CalculateConversion.toFahrenheit(number)
                outputBox.text = String(format:"%.2f", convertedNum)
                print(convertedNum)
                print("C")
            
            case "miles":
                let convertedNum = CalculateConversion.toKilometers(number)
                outputBox.text = String(format:"%.2f", convertedNum)
                print(convertedNum)
                print("M")
            
            case "kilometers":
                let convertedNum = CalculateConversion.toMiles(number)
                outputBox.text = String(format:"%.2f", convertedNum)
                print(convertedNum)
                print("K")
            
            default:
                let convertedNum = 0.0
                outputBox.text = String(format:"%.2f", convertedNum)
            
        }
        
        //outputBox.text = String(format:"%.2f", convertedNum)
        
    }
    
    
    @IBAction func chooseUnits(_ sender: AnyObject) {
        let alert = UIAlertController(title: "", message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Fahrenheit to Celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice A
            self.unit = "fahrenheit"
            print("selected F")
            
        }))
        alert.addAction(UIAlertAction(title: "Celcius to Fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice B
            self.unit = "celcius"
            print("selected C")
            
        }))
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice C
            self.unit = "miles"
            print("selected M")
            
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice D
            self.unit = "kilometers"
            print("selected K")
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    

    
    
    
    
    
    
    
    
    
    
}









