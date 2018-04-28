//
//  ViewController.swift
//  myCalc
//
//  Created by Restricted on 12/23/17.
//  Copyright © 2017 Jordan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen : Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false; //true when math operation is selected
    var operation = 0; //stores operation to be performed
    var colorBool: Bool = false
    //var buttonColor = UIColor.lightGray
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else{
        //display numbers on the screen
        label.text = label.text! + String(sender.tag-1)
        numberOnScreen = Double (label.text!)!
            
            

        }
        
        if colorBool == false {
            sender.backgroundColor = UIColor.red
            colorBool = true;
        } else {
            sender.backgroundColor = UIColor.lightGray
            colorBool = false
        }

        
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        
        //check if a number exist
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(label.text!)!
            if sender.tag == 12 { //Divide
                
                label.text = "/"
                
            } else if sender.tag == 13 { // multiply
                label.text = "x"
                
            } else if sender.tag == 14 { // minus
                label.text = "-"
                
            } else if sender.tag == 15 { //plus
                label.text = "+"
                
                
            } else if sender.tag == 17 { //sqrt()
                label.text = "sqrt"
            }
            operation = sender.tag
            performingMath = true;
        }
        
        else if sender.tag == 16
        {
            sender.backgroundColor = UIColor.lightGray
            if operation == 12
            
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
                
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
                
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
                
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            
            else if operation == 17
            {
                label.text = String(previousNumber.squareRoot())
            }
        }
        
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    
    
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

