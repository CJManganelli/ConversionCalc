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
    @IBOutlet weak var topSuffix: UITextField!
    @IBOutlet weak var bottomSuffix: UITextField!
    
    
    var isThereADecimal: Bool = false
    
    var unitName: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isThereADecimal = false
        inputBox.text = ""
        unitName = "fahrenheit"
        topSuffix.text = " ºC"
        bottomSuffix.text = " ºF"
        
        

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
        update(inputBox.text!)
    }


    @IBAction func decimalBtnPress(_ sender: UIButton) {
        if isThereADecimal == true {
            //isThereADecimal = false
            //outputBox.text! = String(isThereADecimal) //for testing as I build
        }
        else if isThereADecimal == false {
            isThereADecimal = true
            inputBox.text = inputBox.text! + "."
            
            //outputBox.text! = String(isThereADecimal) // for testing as I build
            
        }
    }
    
    
    @IBAction func plusMinusBtnPress(_ sender: UIButton) {
        
        if inputBox.text == "" {
            print("uhhhh")
            // literally do nothing
        } else if inputBox.text == "." {
            // still do nothing
        } else {
            var number = Double(inputBox.text!)
            number = number! * -1.0
            inputBox.text = String(number!)
            update(String(number!))
        }
        
        
        
    }
    
    
    @IBAction func clearBtnPress(_ sender: UIButton) {
        inputBox.text = ""
        outputBox.text = ""
        isThereADecimal = false
    }
    
    
    //Update Function goes here
    
    func update(_ numberString: String) {
        
        let unit: String = self.unitName
        let number = Double(numberString)
        
        switch unit {
            
            case "fahrenheit":
                let convertedNum = CalculateConversion.toCelcius(number!)
                outputBox.text = String(format:"%.2f", convertedNum)
                print(convertedNum)
            
            case "celcius":
                let convertedNum = CalculateConversion.toFahrenheit(number!)
                outputBox.text = String(format:"%.2f", convertedNum)
                print(convertedNum)
            
            case "miles":
                let convertedNum = CalculateConversion.toKilometers(number!)
                outputBox.text = String(format:"%.2f", convertedNum)
                print(convertedNum)
            
            case "kilometers":
                let convertedNum = CalculateConversion.toMiles(number!)
                outputBox.text = String(format:"%.2f", convertedNum)
                print(convertedNum)
            
            default:
                outputBox.text = ""
            
        }
        
        
    }
    
    

    
    @IBAction func chooseUnits(_ sender: AnyObject) {
        let alert = UIAlertController(title: "", message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Fahrenheit to Celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice A
            self.unitName = "fahrenheit"
            self.bottomSuffix.text = " ºF"
            self.topSuffix.text = " ºC"
            print("selected F")
            
        }))
        alert.addAction(UIAlertAction(title: "Celcius to Fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice B
            self.unitName = "celcius"
            self.bottomSuffix.text = " ºC"
            self.topSuffix.text = " ºF"
            print("selected C")
            
        }))
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice C
            self.unitName = "miles"
            self.bottomSuffix.text = " MI"
            self.topSuffix.text = " KM"
            print("selected M")
            
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice D
            self.unitName = "kilometers"
            self.bottomSuffix.text = " KM"
            self.topSuffix.text = " MI"
            print("selected K")
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    

    
    
    
    
    
    
    
    
    
    
}









