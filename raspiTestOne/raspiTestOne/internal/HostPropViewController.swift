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
    @IBOutlet weak var infoFld: UILabel!
    
    @IBAction func saveAtestBtn(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
