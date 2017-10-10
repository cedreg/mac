//
//  HostProperties.swift
//  raspiTestOne
//
//  Created by maci on 10/4/17.
//  Copyright © 2017 maci. All rights reserved.
//

import Foundation

class HostProperties : NSObject {
    
    var userSettings: UserDefaults = UserDefaults()
  
    internal var hostInfo: Dictionary <String, String> = Dictionary <String, String>()
    
    func addInfo(declaration: String, value: String) -> Bool{
        switch declaration {
        case "HostName", "Port", "Sitemap", "Item":
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
    
    internal func saveDataToAppCache() {
        for data in hostInfo {
            userSettings.set(data.value, forKey: data.key)
            //print(data.value)
        }
    }
    
    internal func restoreDataFromAppCache() -> Bool {
        var allDataCouldBeLoaded: Bool = true
        if let hi = userSettings.string(forKey: "HostName"){
            hostInfo["HostName"] = hi
        } else {
            allDataCouldBeLoaded = false
        }
        if let p = userSettings.string(forKey: "Port"){
            hostInfo["Port"] = p
        } else {
            allDataCouldBeLoaded = false
        }
        if let site = userSettings.string(forKey: "Sitemap"){
            hostInfo["Sitemap"] = site
        } else {
            allDataCouldBeLoaded = false
        }
        if let it = userSettings.string(forKey: "Item"){
            hostInfo["Item"] = it
        } else {
            allDataCouldBeLoaded = false
        }
        
        return allDataCouldBeLoaded
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
}
















