//
//  Chapter9_ViewController.swift
//  iOS-first
//
//  Created by JohnPiaPian on 3/23/21.
//

import UIKit

class Chapter9_ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var buttonObject: UIButton!
    @IBOutlet var clickableLink: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true
        
        // Enable virtual keyboard with textView
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    // MARK: methods
    
    // Show keyboard
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == imageView {
            print ("Touched")
        } else {
            print ("Nothing ")
        }
    }

    // Toggle textView Editability
    @IBAction func buttonTapped(_ sender: UIButton) {
        if textView.isEditable == true {
            // Change button label
            buttonObject.setTitle("Edit", for: .normal)
            
            // Text view customization
            textView.isEditable = false
            textView.backgroundColor = UIColor.yellow
            textView.textColor = UIColor.blue
            textView.font = UIFont(name: "Courier", size: 24)
        }else{
            // Change button label
            buttonObject.setTitle("Cancel", for: .normal)
            
            // Text view customization
            textView.isEditable = true
            textView.backgroundColor = UIColor.blue
            textView.textColor = UIColor.white
            textView.font = UIFont(name: "Ariel", size: 10)
        }
    }
    
    // Toggle links clickablity
    @IBAction func clickableButton(_ sender: UIButton) {
        if textView.dataDetectorTypes == UIDataDetectorTypes.link {
            textView.dataDetectorTypes = UIDataDetectorTypes.all
            textView.isSelectable = false
        }else{
            textView.dataDetectorTypes = UIDataDetectorTypes.link
            textView.isSelectable = true
        }
    }
    
}
