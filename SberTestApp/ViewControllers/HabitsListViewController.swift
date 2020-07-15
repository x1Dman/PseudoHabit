//
//  HabitsListViewController.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/14/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import UIKit


protocol HabitsListViewControllerDelegate: class {
    func update(habit: Habit)
}

class HabitsListViewController: UIViewController, HabitsListViewControllerDelegate {
    
    func update(habit: Habit) {
        habits.append(habit)
    }

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
        view.backgroundColor = UIColor.white
        //getHabitsData()

        setupNavBar()
        setupHabitsTableView()
        
        setupHabitsTableViewConstraints()
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
    }
    
    
//    func setupNavigationBarConstaints() {
//        navBar.translatesAutoresizingMaskIntoConstraints = false
//        navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//    }
    
    func setupHabitsTableViewConstraints() {
        habitsTableView.translatesAutoresizingMaskIntoConstraints = false
        habitsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        habitsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        habitsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        habitsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    
    func setupNavBar() {
        let height: CGFloat = 50
        navBar = UINavigationBar(frame: CGRect(x: 0, y: height, width: UIScreen.main.bounds.width, height: height))
        view.addSubview(navBar)
        navBar.backgroundColor = UIColor.white
        navBar.delegate = self as? UINavigationBarDelegate
        //self.navigationItem.rightBarButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(goToNextView)
        )
    }
    
    @objc func goToNextView() {
        print("You TAP !")
        
        let destinationViewController = HabitViewController()
        destinationViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(destinationViewController, animated: true)
        
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


