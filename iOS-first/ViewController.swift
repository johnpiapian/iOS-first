//
//  ViewController.swift
//  iOS-first
//
//  Created by JohnPiaPian on 2/2/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet var ch7Label: UILabel!
    @IBOutlet var ch7TextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Add Observer
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Tap Gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        //Text Field
        ch7TextField?.placeholder = "Email address here"
        ch7TextField?.textColor = UIColor.red
        ch7TextField?.font = UIFont(name: "Courier", size: 16)
        ch7TextField?.clearButtonMode = .whileEditing
    }
    
    // MARK: Methods
    @IBAction func changeCh7Label(_ sender: Any) {
        ch7Label.text = "Text created by Swift \ncode using Xcode"
        ch7Label.numberOfLines = 2
        ch7Label.font = UIFont(name: "Courier", size: 14)
        ch7Label.backgroundColor = UIColor.yellow
        ch7Label.isEnabled = false
    }
    
    @IBAction func displayPassword(_ sender: Any) {
        if(ch7TextField.isSecureTextEntry){
            ch7TextField.isSecureTextEntry = false
            ch7TextField?.placeholder = "Email address here"
        }else{
            ch7TextField.isSecureTextEntry = true
            ch7TextField?.placeholder = "Password here"
            ch7Label.text = ch7TextField.text?.uppercased()
        }
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height
                }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        if ((notification.userInfo? [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    
    


}

