//
//  UserDataList.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/15/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import UIKit

final class UserDataList {
    private enum SettingsKeys: String {
        case Habit
    }
    
    static var habits: [Habit]! {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.Habit.rawValue) as? Data,
                let decodedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? [Habit] else {
                    return nil
            }
            return decodedData
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.Habit.rawValue
            
            if let habits = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: habits, requiringSecureCoding: false){
                    defaults.set(savedData, forKey: key)
                }
            }
        }
    }
}
