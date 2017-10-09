//
//  HTTPManager.swift
//  raspiTestOne
//
//  Created by maci on 10/8/17.
//  Copyright © 2017 maci. All rights reserved.
//

import Foundation

class HTTPManager : NSObject {
    
     internal func requestPresenceCount(_ url: String) {
        guard let address = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: address) { (data, response, error) in
            
            guard let data = data else {return}
            do {
                guard let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject] else {return}
                let numberItem = OHNumberItem(json: jsonResult)
                
                increasePresenceCount(numberItem)
            } catch let jsonErr {
                print("Error reading json", jsonErr)
            }
        }.resume()
        
    }
    
    internal func increasePresenceCount(_ OHNI: OHNumberItem) {
    
    
    
    }
}


struct OHNumberItem {
    let label: String
    let name: String
    let link: String
    let state: Int32
    let type: String
    let groupNames: NSArray
    let tags: NSArray
    
    init (json: [String: AnyObject]){
        label = json["label"] as? String ?? ""
        name = json["name"] as? String ?? ""
        link = json["link"] as? String ?? ""
        type = json["type"] as? String ?? ""
        state = (json["state"] as? NSString ?? "-1").intValue
        groupNames = json["groupName"] as? NSArray ?? []
        tags = json["tags"] as? NSArray ?? []
    }
}

struct OHSwitchItem {
    let link: String
    let state: Bool
    let type: String
    let name: String
    let label: String
    let tags: NSArray
    let groupNames: NSArray
    
    init(json: [String: Any]) {
        link = json["link"] as? String ?? ""
        state = json["state"] as? Bool ?? false // TODO: check if this is working
        type = json["type"] as? String ?? ""
        name = json["name"] as? String ?? ""
        label = json["label"] as? String ?? ""
        tags = json["tags"] as? NSArray ?? []
        groupNames = json["groupNames"] as? NSArray ?? []
    }
}

struct OHStringItem {
    let link: String
    let state: String
    let type: String
    let name: String
    let label: String
    let tags: NSArray
    let groupNames: NSArray
    
    init(json: [String: Any]) {
        link = json["link"] as? String ?? ""
        state = json["state"] as? String ?? ""
        type = json["type"] as? String ?? ""
        name = json["name"] as? String ?? ""
        label = json["label"] as? String ?? ""
        tags = json["tags"] as? NSArray ?? []
        groupNames = json["groupNames"] as? NSArray ?? []
    }
}
