//
//  ViewController.swift
//  raspiTestOne
//
//  Created by maci on 10/2/17.
//  Copyright © 2017 maci. All rights reserved.
//

import UIKit

class NetworkViewController: UIViewController {
    
    let NWInfo = NetworkInfo()
    
    @IBOutlet weak var infoLabel: UILabel! {
        didSet {
            infoLabel.lineBreakMode = .byWordWrapping
            infoLabel.numberOfLines = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NWInfo.restoreSSID() {
            infoLabel.text? = "Gespeicherte Netzwerkdaten erfolgreich geladen\n\n"
            infoLabel.text?.append("SSID: \(NWInfo.getSSID()!)\n")
            infoLabel.text?.append("MAC: \(NWInfo.getBSSID()!)")
        } else {
            infoLabel.text? = "Bitte Netzwerk auswählen"
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ssidBtn(_ sender: UIButton) {
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
        if NWInfo.saveSSID() {
            infoLabel.text?.append("\n\nErfolgreich gespeichert") // TODO: more then one append possible
        } else {
            infoLabel.text? = "Konnte nicht speichern, bitte erneut versuchen"
        }
//
//        let HTTP = HTTPManager()
//
//        HTTP.requestPresenceCount("http://192.168.178.162:8080/rest/items/DEMONUM")
    }
    
    
}

