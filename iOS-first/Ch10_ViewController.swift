//
//  Ch10_ViewController.swift
//  iOS-first
//
//  Created by JohnPiaPian on 3/29/21.
//

import UIKit

class Ch10_ViewController: UIViewController {

    @IBOutlet var buttonObject: UIButton!
    @IBOutlet var labelObject: UILabel!
    @IBOutlet var switchObject: UISwitch!
    @IBOutlet var segmentedController: UISegmentedControl!
    @IBOutlet var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        segmentedController.insertSegment(withTitle: "Three", at: 2, animated: true)
        segmentedController.setWidth(50, forSegmentAt: 0)
        segmentedController.setWidth(50, forSegmentAt: 1)
        segmentedController.setWidth(50, forSegmentAt: 2)
        
        labelResult.frame.size.width = 120
    }
    
    // MARK: methods
    @IBAction func touchInside(_ sender: Any) {
        buttonObject.setTitle("New", for: UIControl.State.normal)
        switchObject.onTintColor = UIColor.red
        switchObject.tintColor = UIColor.blue
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        if switchObject.isOn {
            labelObject.text = "On"
        }else{
            labelObject.text = "Off"
        }
    }
    
    @IBAction func segmentedControlTapped(_ sender: Any) {
        switch segmentedController.selectedSegmentIndex {
        case 0:
            labelObject.text = "One"
        case 1:
            labelObject.text = "Two"
        default:
            labelObject.text = "Three"
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 1:
            labelResult.text = "Button 1"
        case 2:
            labelResult.text = "Button 2"
        default:
            labelResult.text = "Default"
        }
    }
    
    @IBAction func buttonRespond(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            labelResult.text = sender.titleLabel?.text
        case 2:
            labelResult.text = sender.titleLabel?.text
        default:
            labelResult.text = "Default"
        }
    }
    
}
