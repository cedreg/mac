//
//  DispatcherController.swift
//  raspiTestOne
//
//  Created by Cedric Regenass on 10.10.17.
//  Copyright © 2017 maci. All rights reserved.
//

import Foundation

class DispatcherController : NSObject{
    private var timerValue: Int = -1
    var isActive: Bool = false
    
    func setTimerValue(_ value: Int) {
        timerValue = value
    }
    
    func getTimerValue() -> Int {
        return timerValue
    }
    
    func save() {
        UserDefaults.standard.set(timerValue, forKey: "DispatchTime")
    }
    
    func restore() {
        if let time = UserDefaults.standard.object(forKey: "DispatchTime") as? Int {
            timerValue = time
        }
    }
}
