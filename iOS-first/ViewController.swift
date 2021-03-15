//
//  ViewController.swift
//  iOS-first
//
//  Created by JohnPiaPian on 2/2/21.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    
    // MARK: Properties
    @IBOutlet var ch7Label: UILabel!
    @IBOutlet var ch7TextField: UITextField!
    @IBOutlet var stepperLabel: UILabel!
    @IBOutlet var stepperValue: UIStepper!
    @IBOutlet var sliderValue: UISlider!
    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var progressLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var progressStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        activityIndicator?.hidesWhenStopped = true
        progressView?.progress = 0
        progressStepper?.stepValue = 0.1
        progressStepper?.maximumValue = 1.0
        
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
    
    @IBAction func stepperChanged(_ sender: Any) {
        stepperLabel.text = "\(stepperValue.value)"
    }
    
    @IBAction func changeStepper(_ sender: Any) {
        stepperValue.minimumValue = -10
        stepperValue.maximumValue = -5
        stepperValue.stepValue = 0.5
        stepperValue.isContinuous = true
        stepperValue.autorepeat = true
        stepperValue.wraps = true
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        sliderLabel.text = "\(sliderValue.value)"
    }
    
    @IBAction func changeSlider(_ sender: Any) {
        sliderValue.minimumValue = 1
        sliderValue.maximumValue = 25
        sliderValue.value = 7
        sliderValue.minimumTrackTintColor = UIColor.red
        sliderValue.maximumTrackTintColor = UIColor.green
        sliderValue.thumbTintColor = UIColor.black
    }
    
    @IBAction func runButton(_ sender: Any) {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            timer in
            self.activityIndicator.startAnimating()
            self.counter += 1
            
            if self.counter >= 5 {
                self.activityIndicator.stopAnimating()
                timer.invalidate()
                self.counter = 0
            }
        }
    }
    
    @IBAction func progressStepperChanged(_ sender: Any) {
        progressLabel.text = "Completed \(Int(progressStepper.value * 10)) of 10 tasks"
        progressView.progress = Float(progressStepper.value)
    }
    
}

