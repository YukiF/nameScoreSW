//
//  ViewController.swift
//  nameScoreSW
//
//  Created by Yuki.F on 2015/03/10.
//  Copyright (c) 2015年 Yuki Futagami. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        //↓↓　don't forget to write
        super.viewWillAppear(animated)
        self.textField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
       //send the order to sendButton "touch up inside"
        self.sendButton.sendActionsForControlEvents(.TouchUpInside)
        return true
    }
    
    func showAlert(){
        //because the code depends on the version
        //get the version
        let VERSION : Float = (UIDevice.currentDevice().systemVersion as NSString).floatValue
        if VERSION >= 8.0{
            let alertController = UIAlertController(title: "Error", message: "Please enter your name", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }else{
            let alert = UIAlertView()
            alert.title = "Error"
            alert.message = "Please enter your name"
            alert.addButtonWithTitle("OK")
            alert.show()
            
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        //in this method,you can write the code whether the segue happens or not
        if identifier == "showResult"{
            if self.textField.text == ""{
                self.showAlert()
                return false
            }
            return true
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //in this method,you can write the code for that time the segue happens
        //decide the viewController and connect
        if segue.identifier == "showResult"{
            let resultViewController :ResultViewController = segue.destinationViewController as ResultViewController
            resultViewController.myName = textField.text
            //disconnect the focus on the textField
            self.textField.resignFirstResponder()
        }
    }


}

/*
view → content hugging priority
decide how it could be bigger 


*/

