//
//  ViewController.swift
//  raspiTestOne
//
//  Created by maci on 10/2/17.
//  Copyright © 2017 maci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let NWInfo = NetworkInfo()
    
    @IBOutlet weak var ssidLabel: UILabel!
    @IBOutlet weak var bssidLabel: UILabel!
    @IBOutlet weak var ssiddataLabel: UILabel!
    
    @IBAction func ssidBtn(_ sender: UIButton) {
        
        if let networkData = NWInfo.getSSID(){
            ssidLabel.text = networkData["SSID"]
            bssidLabel.text = networkData["BSSID"]
            ssiddataLabel.text = networkData["SSIDDATA"]
        } else {
            ssidLabel.text = "No Wireless Connection."
            bssidLabel.text = "Connect your phone to a accesspoint"
            ssiddataLabel.text = ""
        }
    }

    
    
    
}

