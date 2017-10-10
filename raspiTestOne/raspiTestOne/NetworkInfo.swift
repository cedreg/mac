//
//  NetworkInfo.swift
//  raspiTestOne
//
//  Created by maci on 10/2/17.
//  Copyright © 2017 maci. All rights reserved.
//

import Foundation
import SystemConfiguration.CaptiveNetwork

class NetworkInfo : NSObject {
    
    private var doc: Dictionary <String, String> = Dictionary <String, String>()

    private func saveNWData(){
        if let interfaces = CNCopySupportedInterfaces() as? [String] {
            if interfaces.count < 1 {
                doc.removeAll()
            }else{
                if let intefaceInfos = CNCopyCurrentNetworkInfo(interfaces[0] as CFString){
                    let interfaceData = intefaceInfos as! Dictionary <String, AnyObject>
                    
                    for data in interfaceData {
                        doc[data.key] = data.value as? String
                        //print ("__\(data)")
                    }
                }else {
                    doc.removeAll()
                }
            }
        }else{
            doc.removeAll()
        }
    }
    
    func getSSID() -> String? {
        if !doc.isEmpty {
            return doc["SSID"]
        } else {
            return nil
        }
    }
    
    func getBSSID() -> String?{
        if !doc.isEmpty {
            return doc["BSSID"]
        } else {
            return nil
        }
    }
    
    func isConnected() -> Bool {
        saveNWData()
        if !doc.isEmpty{
            return true
        } else {
            return false
        }
    }
    
    func saveSSID() -> Bool {
        if doc["BSSID"] != "" {
            UserDefaults.standard.set(doc["BSSID"], forKey: "WirelessMAC")
        } else {
            return false
        }
        if doc["SSID"] != "" {
            UserDefaults.standard.set(doc["SSID"], forKey: "WirelessSSID")
        } else {
            return false
        }
        return true
    }
    
    func restoreSSID() -> Bool {
        if let mac = UserDefaults.standard.string(forKey: "WirelessMAC") {
            doc["BSSID"] = mac
        } else {
            return false
        }
        if let ssid = UserDefaults.standard.string(forKey: "WirelessSSID") {
            doc["SSID"] = ssid
        } else {
            return false
        }
        return true
    }
    
}
