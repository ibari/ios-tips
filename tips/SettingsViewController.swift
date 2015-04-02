//
//  SettingsViewController.swift
//  tips
//
//  Created by Ian on 4/1/15.
//  Copyright (c) 2015 ibari. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("tip_percentage_index") != nil)  {
            tipControl.selectedSegmentIndex = defaults.integerForKey("tip_percentage_index")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        //var tipPercentages = [0.18, 0.2, 0.22]
        //var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "tip_percentage_index")
        defaults.synchronize()
    }

    @IBAction func onTouchDown(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
