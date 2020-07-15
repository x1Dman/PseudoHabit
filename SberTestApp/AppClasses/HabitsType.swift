//
//  HabitsType.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/14/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import UIKit

enum HabitsType {
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
}
