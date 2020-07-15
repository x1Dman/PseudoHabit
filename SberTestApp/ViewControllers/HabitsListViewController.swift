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
    var navBar = UINavigationBar()
    var addButton = UIButton(type: .roundedRect)
    
    struct CellConst {
        static let habitCell = "HabitCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pseudo's Habits"
        getHabitsData()
        setupHabitsTableView()
        setupNavBar()
        setupButton()
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
        // set constraints
        habitsTableView.pinEdges(to: view)
    }
    
    func setupButton() {
        addButton.setTitle("+", for: .normal)
        addButton.frame = CGRect(x: 500, y: 100, width: 80, height: 80)
        addButton.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(addButton)
    }
    
    @objc func buttonClicked(_ : UIButton) {
        print("Button was tapped")
    }
    
    func setupNavBar() {
        view.addSubview(navBar)
        let height: CGFloat = 80
        navBar = UINavigationBar(frame: CGRect(x: 0, y: height, width: UIScreen.main.bounds.width, height: height))
        navBar.backgroundColor = UIColor.white
        navBar.delegate = self as? UINavigationBarDelegate
        
        let navItem = UINavigationItem()
        //navItem.title = "Pseudo's Habits"
        navItem.rightBarButtonItem = UIBarButtonItem(
            title: "+",
            style: .done,
            target: self,
            action: #selector(goToNextView)
        )
        navBar.items = [navItem]
    }
    
    @objc func goToNextView() {
        print("buttonPushed")
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


