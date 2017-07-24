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
    
    var unit: String = "fahrenheit"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isThereADecimal = false
        inputBox.text = ""

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func numBtnPress(_ sender: UIButton) {
        
        let number = Int(sender.accessibilityLabel!)
        
        inputBox.text = inputBox.text! + String(number!)
        
        
        
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
        }
        
        
        //And then update output textfield
        
    }
    
    
    @IBAction func clearBtnPress(_ sender: UIButton) {
        inputBox.text = nil
        isThereADecimal = false
        
        
        // Dev code used for testing as I build //
        outputBox.text = String(unit)
        //*************************************///
        
        
        //And then update output textfield
    }
    
    
    //Update Function goes here
    
    func update(_ number: Double) {
        
    }
    
    
    @IBAction func chooseUnits(_ sender: AnyObject) {
        let alert = UIAlertController(title: "", message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Fahrenheit to Celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice A
            self.unit = "fahrenheit"
            
        }))
        alert.addAction(UIAlertAction(title: "Celcius to Fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice B
            self.unit = "celcius"
            
        }))
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice C
            self.unit = "miles"
            
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice D
            self.unit = "kilometers"
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    

    
    
    
    
    
    
    
    
    
    
}









