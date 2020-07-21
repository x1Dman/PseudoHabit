//
//  HabitsType.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/14/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import UIKit


enum HabitsType: Int {
    case relaxing
    case intelligently
    case sporty
    case healthy
    case nonType
    
    var color: UIColor {
        switch self {
            case .healthy:
                return UIColor.yellow
            case .sporty:
                return UIColor.red
            case .intelligently:
                return UIColor.blue
            case .relaxing:
                return UIColor.green
            case .nonType:
                return UIColor.black
        }
    }
    
    static func getType(fromPriority value: Int16) -> HabitsType {
        switch value {
            case 0:
                return .relaxing
            case 1:
                return .intelligently
            case 2:
                return .sporty
            case 3:
                return .healthy
            default:
                return .sporty
        }
    }
    
}
