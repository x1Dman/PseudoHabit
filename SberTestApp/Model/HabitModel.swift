//
//  HabbitModel.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/20/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import Foundation

struct HabitModel {
    static let noneHabitInfo = "None"
    
    var name: String
    var type: Int16
    var motivation: String
    var dates: [String]
    
    init(withHabitDB value: HabitDB) {
        name = value.habitNameDB ?? HabitModel.self.noneHabitInfo
        type = value.habitTypeDB
        dates = value.datesDB ?? []
        motivation = value.habitsMotivationDB ?? HabitModel.self.noneHabitInfo
    }
    
    init(name: String?, type: Int16, motivation: String?, dates: [String]?) {
        self.name = name ?? HabitModel.self.noneHabitInfo
        self.type = type
        self.dates = dates ?? []
        self.motivation = motivation ?? HabitModel.self.noneHabitInfo
    }
}
