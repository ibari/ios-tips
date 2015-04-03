//
//  TipViewController.swift
//  tips
//
//  Created by Ian on 3/8/15.
//  Copyright (c) 2015 ibari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipResultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        let now = NSDate()
        println(now.timeIntervalSinceReferenceDate)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        // Set default tip segment selected index
        tipControl.selectedSegmentIndex = defaults.integerForKey("tip_percentage_index")
        
        // Hide tip result area
        if (billField.text == "") {
            self.tipResultView.alpha = 0
        } else {
            onEditingChanged(view)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount : Double = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        // Formt tip result labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
       
        // Show tip result area
        UIView.animateWithDuration(0.4, animations: {
            self.tipResultView.alpha = 1
        })
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

