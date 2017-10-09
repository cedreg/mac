//
//  ViewController.swift
//  raspiTestOne
//
//  Created by maci on 10/2/17.
//  Copyright © 2017 maci. All rights reserved.
//

import UIKit

class NetworkViewController: UIViewController {
    
    var userSettings: UserDefaults = UserDefaults()
    let NWInfo = NetworkInfo()
    
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ssidBtn(_ sender: UIButton) {
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 0
        
        if NWInfo.isConnected() {
            if let networkSSID = NWInfo.getSSID(){
                infoLabel.text? = "SSID: \(networkSSID)\n"
                
            }
            if let networkBSSID = NWInfo.getBSSID(){
                infoLabel.text?.append("MAC: \(networkBSSID)")
            }
        } else {
            infoLabel.text? = "No Wireless Connection.\nConnect your phone to a accesspoint."
        }
    }

    
    @IBAction func selectNWBtn(_ sender: UIButton) {
        let HTTP = HTTPManager()
        
        HTTP.requestPresenceCount("http://192.168.178.162:8080/rest/items/DEMONUM")
    }
    
    
}

