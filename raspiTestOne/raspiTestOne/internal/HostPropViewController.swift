//
//  HostPropViewController.swift
//  raspiTestOne
//
//  Created by maci on 10/4/17.
//  Copyright © 2017 maci. All rights reserved.
//

import UIKit

class HostPropViewController: UIViewController {

    
    @IBOutlet weak var hostnameFld: UITextField!
    @IBOutlet weak var portFld: UITextField!
    @IBOutlet weak var sitemapFld: UITextField!
    @IBOutlet weak var itemFld: UITextField!
    @IBOutlet weak var infoFld: UILabel! {
        didSet {
            infoFld.lineBreakMode = .byWordWrapping
            infoFld.numberOfLines = 0
        }
    }
    let hostP: HostProperties = HostProperties()
    
    @IBAction func btnCall(_ sender: UIButton) {
        
        let btn = sender.currentTitle!
        switch btn {
//        case "Show Host":
//            hostnameFld.text = hostP.getInfo(declaration: "HostName")
//            portFld.text = hostP.getInfo(declaration: "Port")
//            sitemapFld.text = hostP.getInfo(declaration: "Sitemap")
//            itemFld.text = hostP.getInfo(declaration: "Item")
//
//            infoFld.text? = "ShowHost"
        case "Save Host":
            _ = hostP.addInfo(declaration: "HostName", value: hostnameFld.text!)
            _ = hostP.addInfo(declaration: "Port", value: portFld.text!)
            _ = hostP.addInfo(declaration: "Sitemap", value: sitemapFld.text!)
            _ = hostP.addInfo(declaration: "Item", value: itemFld.text!)
            hostP.saveDataToAppCache()
            
            infoFld.text? = "Host Datan wurden gespeichert"
//        case "Restore Host":
//            hostP.restoreDataFromAppCache()
//
//            infoFld.text? = "RestoreHost"
        default:
            infoFld.text? = "Error occured within the hostProperties"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // restore data from userdefaults
        let loadSuccessfully = hostP.restoreDataFromAppCache()
        // show restored data
        if loadSuccessfully {
            hostnameFld.text = hostP.getInfo(declaration: "HostName")
            portFld.text = hostP.getInfo(declaration: "Port")
            sitemapFld.text = hostP.getInfo(declaration: "Sitemap")
            itemFld.text = hostP.getInfo(declaration: "Item")
            infoFld.text? = "Alle Daten konnten erfolgreich geladen werden"
        } else {
            infoFld.text? = "Bitte Hostdaten angeben"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
