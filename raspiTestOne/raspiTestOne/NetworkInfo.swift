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
    
    func getSSID() -> Dictionary<String, String>? {
        
        if let interfaces = CNCopySupportedInterfaces() as? [String] {
            if interfaces.count < 1 {
                return nil
            }else{
                if let intefaceInfos = CNCopyCurrentNetworkInfo(interfaces[0] as CFString){
                    let interfaceData = intefaceInfos as! Dictionary <String, AnyObject>
                    
                    var doc: Dictionary <String, String> = Dictionary <String, String>()
                    for data in interfaceData {
                        doc[data.key] = data.value as? String
                        //print ("__\(data)")
                    }
                    return doc
                }else {
                    return nil
                }
            }
        }else{
            return nil
        }
    }
    
    
}
