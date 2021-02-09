//
//  ViewController.swift
//  iOS-first
//
//  Created by JohnPiaPian on 2/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelResult: UILabel!
    @IBOutlet var textMessaging: UITextField!
    
    @IBAction func changeButton(_ sender: UIButton) {
        labelResult.text = textMessaging.text?.uppercased();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

