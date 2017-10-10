//
//  DispatcherViewController.swift
//  raspiTestOne
//
//  Created by maci on 10/4/17.
//  Copyright © 2017 maci. All rights reserved.
//

import UIKit

class DispatcherViewController: UIViewController {

    @IBOutlet weak var secondsFld: UITextField!
    
    let d = DispatcherController()
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            d.isActive = true
            if let tVal = Int(secondsFld.text!) {
                d.setTimerValue(tVal)
                d.save()
            }
        } else {
            d.isActive = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        d.restore()
        updateUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(){
        if d.getTimerValue() == -1 {
            secondsFld.text? = ""
        } else {
            secondsFld.text? = String(d.getTimerValue())
        }
    }
    
    func performTask(what: String) -> Bool {
        switch what {
        case "increase":
            print("increaseCounterByOne")
            return true
        default:
            print("error, \(what) is no usable option")
            return false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
