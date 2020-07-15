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

class HabitsListViewController: UIViewController, HabitsViewControllerDelegate {
    

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
        habits = UserDataList.habits
        habits.sort{(item1, item2) -> Bool in
            return item1.habitType.getPriority() > item2.habitType.getPriority()
        }
        setupNavBar()
        setupHabitsTableView()
        
        setupHabitsTableViewConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // JESUS...
        habits.sort{(item1, item2) -> Bool in
            return item1.habitType.getPriority() > item2.habitType.getPriority()
        }
        habitsTableView.reloadData()
        
        UserDataList.habits = self.habits
        print(UserDataList.habits)
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
        let destinationViewController = HabitViewController()
        destinationViewController.modalPresentationStyle = .fullScreen
        destinationViewController.delegate = self
        self.navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    func didFinishSecondVC(controller: HabitViewController) {
        self.habits.append(Habit(habitType: controller.habitType, motivatingText: controller.habitMotivationTextField.text, habitName: controller.habitNameTextField.text!, dates: []))
        controller.navigationController?.popViewController(animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // move there!!!!!!
        
        let habitInfoVC = HabitInfoViewController()
        
        // fix this 100%%%
        habitInfoVC.habitsName.text = habits[indexPath.row].habitName
        habitInfoVC.habitsMotivation.text = habits[indexPath.row].motivatingText
        habitInfoVC.viewColor = habits[indexPath.row].habitType.getColor()
        habitInfoVC.dates = habits[indexPath.row].checkInDates
        habitInfoVC.habit = habits[indexPath.row]
        //Push Your controller if your view is already part of NavigationController stack
        self.navigationController?.pushViewController(habitInfoVC, animated: true)
    }
    
    // DELETE DATA FROM SOURCE ARRAY
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        habits.remove(at: indexPath.row)
        habitsTableView.deleteRows(at: [indexPath], with: .fade)
    }
}


extension HabitsListViewController {
    func generateData() -> [Habit] {
        let h1 = Habit(habitType: .relaxing, motivatingText: "JUST DO IT!!!", habitName: "ChillZone", dates: ["07-10-2020", "07-13-2020"])
        let h2 = Habit(habitType: .sporty, motivatingText: "JUST DO IT!!!", habitName: "Swimming", dates: ["07-13-2020"])
//        let h3 = Habit(habitType: .intelligently, motivatingText: "JUST DO IT!!!", habitName: "Chess")
//        let h4 = Habit(habitType: .healthy, motivatingText: "JUST DO IT!!!", habitName: "Sauna")
        
        return [h1, h2]
    }
}


