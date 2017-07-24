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
        outputBox.text = unit
        //*************************************///
        
        
        //And then update output textfield
    }
    
    
    @IBAction func chooseUnits(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Choice", message: "Choose!", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "A", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice A
            self.unit = "A"
            
        }))
        alert.addAction(UIAlertAction(title: "B", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice B
            self.unit = "B"
            
        }))
        alert.addAction(UIAlertAction(title: "C", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice C
            self.unit = "C"
            
        }))
        alert.addAction(UIAlertAction(title: "D", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice D
            self.unit = "D"
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    

    
    
    
    
    
    
    
    
    
    
}









