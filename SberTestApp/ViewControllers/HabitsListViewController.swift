//
//  HabitsListViewController.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/14/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import UIKit

class HabitsListViewController: UIViewController {
    
    var habitsTableView = UITableView()
    var habits: [Habit] = []
    
    struct CellConst {
        static let habitCell = "HabitCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pseudo's Habits"
        getHabitsData()
        setupHabitsTableView()
    }
    
    func setupHabitsTableView() {
        view.addSubview(habitsTableView)
        // set delegates
        habitsTableView.delegate = self
        habitsTableView.dataSource = self
        // cell height
        // TODO DYNAMIC CELLS
        habitsTableView.rowHeight = 100
        
        habitsTableView.register(HabitCell.self, forCellReuseIdentifier: CellConst.habitCell)
        // set constaints
        habitsTableView.pinEdges(to: view)
    }
    
    func getHabitsData() {
        habits = generateData()
    }
    
}



extension HabitsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let habitCell = tableView.dequeueReusableCell(withIdentifier: CellConst.habitCell) as! HabitCell
        let habit = habits[indexPath.row]
        habitCell.set(habit: habit)        
        return habitCell
    }
}


extension HabitsListViewController {
    func generateData() -> [Habit] {
        let h1 = Habit(habitType: .relaxing, motivatingText: "JUST DO IT!!!", habitName: "ChillZone")
        let h2 = Habit(habitType: .sporty, motivatingText: "JUST DO IT!!!", habitName: "Swimming")
        let h3 = Habit(habitType: .intelligently, motivatingText: "JUST DO IT!!!", habitName: "Chess")
        let h4 = Habit(habitType: .healthy, motivatingText: "JUST DO IT!!!", habitName: "Sauna")
        
        return [h1, h2, h3, h4]
    }
}


