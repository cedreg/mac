//
//  HostProperties.swift
//  raspiTestOne
//
//  Created by maci on 10/4/17.
//  Copyright © 2017 maci. All rights reserved.
//

import Foundation

class HostProperties : NSObject {
  
    internal var hostInfo: Dictionary <String, String> = Dictionary <String, String>()
    
    func addInfo(declaration: String, value: String) -> Bool{
        switch value {
        case "HostName", "Prot", "Sitename", "Item":
            hostInfo[declaration] = value
            return true
        default:
            return false
        }
    }
    
    func exists(declaration: String) -> Bool {
        return hostInfo.index(forKey: declaration) != nil ? true : false
    }
    
    func getInfo(declaration: String) -> String? {
        if exists(declaration: declaration) {
            return hostInfo[declaration]
        } else {
            return nil
        }
    }
    
    func testConnection() -> Bool {
        
        return true
    }
    
    internal func saveDataToAppCache() {
       //UserDefaults.standard.set(hostInfo, forKey: "HostInfo")
    }
    
    internal func restoreDataFromAppCache() {
        //if let data:Dictionary<String, AnyObject> = UserDefaults.dictionary("HostInfo") {
        //    hostInfo = data
        //}
    }
    
    internal func createLink() -> String?{
        let HN = getInfo(declaration: "HostName")
        let P  = getInfo(declaration: "Port")
        let I  = getInfo(declaration: "Item")
        
        if HN != nil && P != nil && I != nil {
            let link = "http://" + HN! + ":" + P! + "/rest/items/" + I!
            return link
        } else {
            return nil
        }
    }
    
    /*private var hostInfo: Dictionary <String, HostProps> = [
        "HostName" : .HostName(IP(ipString: String)),
        "Port" : .Port,
        "Sitemap" : .Sitemap,
        "Item" : .Item
    ]

    private enum HostProps {
        case HostName((String))
        case Port
        case Sitemap
        case Item
    }*/
}
