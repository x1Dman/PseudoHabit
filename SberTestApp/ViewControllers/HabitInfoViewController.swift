//
//  HabitInfoViewController.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/15/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import FSCalendar
import UIKit

class HabitInfoViewController: UIViewController, FSCalendarDelegate, FSCalendarDelegateAppearance {
    
    var habit = Habit(habitType: .relaxing, motivatingText: "JUST DO IT!!!", habitName: "ChillZone", dates: ["07-10-2020", "07-13-2020"])
    // only for habit
    var habitInfoView = UIView()
    var viewColor = UIColor()
    var habitsMotivation = UITextView()
    var habitsName = UITextView()
    var dates: [String] = []
    var acceptHabitButton = UIButton()
    
    // calendar
    var calendar = FSCalendar()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white

        setupView()
        setupCalendar()
        // constraints
        setTextConstraints()
        //setViewConstraints()
        setCalendarConstraints()
    }
    
    func setupView() {
        habitsName.backgroundColor = viewColor.withAlphaComponent(0.5)
        habitsName.textAlignment = .center
        habitsMotivation.backgroundColor = viewColor.withAlphaComponent(0.5)
        habitsMotivation.textAlignment = .center
        
        
        habitsName.font = UIFont(name: habitsName.font!.fontName, size: 20)
        habitsMotivation.font = UIFont(name: habitsMotivation.font!.fontName, size: 20)
        //habitInfoView.addSubview(habitsMotivation)
        //habitInfoView.addSubview(habitsName)
        //view.addSubview(habitInfoView)
//        acceptHabitButton.setTitle("Done Habit", for: .normal)
//        acceptHabitButton.tintColor = .black
        acceptHabitButton = UIButton(type: .roundedRect)
        acceptHabitButton.frame.size.width = 200
        acceptHabitButton.frame.size.height = 50
//        acceptHabitButton.frame = CGRect(
//            x: habitsMotivation.frame.size.width/2 - acceptHabitButton.frame.size.width/2,
//            y: habitsMotivation.frame.size.height/2 - acceptHabitButton.frame.size.height/2,
//            width: acceptHabitButton.frame.size.width,
//            height: acceptHabitButton.frame.size.height
//        )
        acceptHabitButton.setTitle("Accept Habit", for: .normal)
        acceptHabitButton.addTarget(self, action: #selector(acceptClicked), for: .touchUpInside)
        acceptHabitButton.center.x = view.frame.midX
        acceptHabitButton.center.y = view.frame.midY + 100
        view.addSubview(habitsMotivation)
        view.addSubview(habitsName)
        view.addSubview(acceptHabitButton)
    }
    
    @objc func acceptClicked() {
        let habitListVC = HabitsListViewController()
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatConst.dateFormat
        let curDate = Date()
        dates.append(formatter.string(from: curDate))
        habit.checkInDates = dates
        for h in habitListVC.habits {
            if h.habitName == habit.habitName {
                h.checkInDates = dates
            }
        }
        print("Added date")
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupCalendar() {
        calendar.delegate = self
        // turn off the possible swipes
        calendar.isUserInteractionEnabled = false
        calendar.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.addSubview(calendar)
    }
    
    func setViewConstraints() {
        habitInfoView.translatesAutoresizingMaskIntoConstraints = false
        habitInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        habitInfoView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        habitInfoView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2.5).isActive = true
        //habitInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setTextConstraints() {
//        habitsName.translatesAutoresizingMaskIntoConstraints = false
//        habitsName.topAnchor.constraint(equalTo: habitInfoView.topAnchor).isActive = true
//        habitsName.widthAnchor.constraint(equalTo: habitInfoView.widthAnchor).isActive = true
//        habitsName.heightAnchor.constraint(equalToConstant: habitInfoView.frame.size.height / 2.0).isActive = true
        
        //
//        habitsMotivation.translatesAutoresizingMaskIntoConstraints = false
//        habitsMotivation.topAnchor.constraint(greaterThanOrEqualTo: habitsName.bottomAnchor, constant: 10).isActive = true
//        habitsMotivation.widthAnchor.constraint(equalTo: habitInfoView.widthAnchor).isActive = true
//        habitsMotivation.heightAnchor.constraint(equalToConstant: habitInfoView.frame.size.height / 2.0).isActive = true
        
        habitsName.translatesAutoresizingMaskIntoConstraints = false
        habitsName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        habitsName.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        habitsName.heightAnchor.constraint(equalToConstant: view.frame.size.height / 4.0).isActive = true
        
        habitsMotivation.translatesAutoresizingMaskIntoConstraints = false
        habitsMotivation.topAnchor.constraint(greaterThanOrEqualTo: habitsName.bottomAnchor).isActive = true
        habitsMotivation.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        habitsMotivation.heightAnchor.constraint(equalToConstant: view.frame.size.height / 4.0).isActive = true
        
        
//        acceptHabitButton.translatesAutoresizingMaskIntoConstraints = false
//        acceptHabitButton.topAnchor.constraint(equalTo: habitsMotivation.topAnchor, constant: 50).isActive = true
//        //acceptHabitButton.widthAnchor.constraint(equalTo: habitsMotivation.widthAnchor).isActive = true
//       //acceptHabitButton.heightAnchor.constraint(equalToConstant: habitsMotivation.frame.size.height / 2.0).isActive = true
//        acceptHabitButton.bottomAnchor.constraint(equalTo: habitsMotivation.bottomAnchor).isActive = true
    }
    
    func setCalendarConstraints() {
        calendar.translatesAutoresizingMaskIntoConstraints = false
        //calendar.topAnchor.constraint(equalTo: habitInfoView.bottomAnchor).isActive = true
        calendar.topAnchor.constraint(equalTo: habitsMotivation.bottomAnchor).isActive = true
        calendar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2.5).isActive = true
        //calendar.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: view.bottomAnchor).isActive = true
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatConst.dateFormat
        let curDate = Date()
        if formatter.string(from: date) == formatter.string(from: curDate) {
            // trash...
            cell.shapeLayer.backgroundColor = viewColor.cgColor
        }
    }
    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "EEEE MM-dd-YYYY"
//        let formatterString = formatter.string(from: date)
//        print("kek")
//    }
    
    
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM-dd-YYYY"
//        if dates.contains(formatter.string(from: date)) {
//            print("HURRAY!")
//            return UIColor.blue
//        }
//        return UIColor.clear
//    }
    
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatConst.dateFormat
        if dates.contains(formatter.string(from: date)) {
            print("HURRAY!")
            return UIColor.blue
        }
        return UIColor.clear
    }
    
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorFor date: Date) -> [UIColor]? {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM-dd-YYYY"
//        if dates.contains(formatter.string(from: date)) {
//            return [UIColor.blue]
//        }
//
//        return [UIColor.clear]
//    }

}
