//
//  HabitsType.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/14/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import UIKit

enum HabitsType: String {
    case relaxing
    case sporty
    case intelligently
    case healthy
    
    func getColor() -> UIColor {
        switch self {
        case .healthy:
            return UIColor.yellow
        case .sporty:
            return UIColor.red
        case .intelligently:
            return UIColor.blue
        case .relaxing:
            return UIColor.green
        }
    }
    
    func getPriority() -> Int {
        switch self {
        case .healthy:
            return 4
        case .sporty:
            return 3
        case .intelligently:
            return 2
        case .relaxing:
            return 1
        }
    }
}
