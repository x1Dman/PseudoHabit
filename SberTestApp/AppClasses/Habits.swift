//
//  Habits.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/14/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import Foundation

public class Habit: NSObject, NSCoding {
    // for USERDATA
    public func encode(with coder: NSCoder) {
        coder.encode(habitName, forKey: "habitName")
        coder.encode(motivatingText, forKey: "motivatingText")
        coder.encode(habitType.rawValue, forKey: "habitType")
        coder.encode(checkInDates, forKey: "dates")
    }
    
    public required init?(coder: NSCoder) {
        habitName = coder.decodeObject(forKey: "habitName") as? String ?? ""
        motivatingText = coder.decodeObject(forKey: "motivatingText") as? String ?? ""
        habitType = HabitsType(rawValue: coder.decodeObject(forKey: "habitType") as! String) ?? HabitsType.relaxing
        checkInDates = coder.decodeObject(forKey: "dates") as? [String] ?? []
        // = coder.decodeObject(forKey: "habitName") as? String ?? ""
        
    }
    
    var habitType: HabitsType
    var motivatingText: String? = ""
    var habitName: String = ""
    var checkInDates: [String] = []
    
    init(habitType: HabitsType, motivatingText: String?, habitName: String, dates: [String]) {
        self.habitName = habitName
        self.motivatingText = motivatingText
        self.habitType = habitType
        self.checkInDates = dates
    }
    
    override init(){
        self.habitName = "Name"
        self.motivatingText = "DO IT!"
        self.habitType = .sporty
        self.checkInDates = []
    }
    
    func toString() -> String {
        return "\(habitName), \(String(describing: motivatingText)), \(habitType)"
    }
}
