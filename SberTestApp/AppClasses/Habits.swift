//
//  Habits.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/14/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import Foundation

public class Habit {
    var habitType: HabitsType
    var motivatingText: String? = ""
    var habitName: String = ""
    init(habitType: HabitsType, motivatingText: String?, habitName: String) {
        self.habitName = habitName
        self.motivatingText = motivatingText
        self.habitType = habitType
    }
}
