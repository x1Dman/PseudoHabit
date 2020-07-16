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
    
    var habit = Habit()
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
        setupViewData()
        setupTextView()
        setupCalendar()
        // constraints
        setTextViewConstraints()
        //setViewConstraints()
        setCalendarConstraints()
    }
    
    func setupViewData() {
        habitsName.text = habit.habitName
        habitsMotivation.text = habit.motivatingText
        viewColor = habit.habitType.getColor()
        dates = habit.checkInDates
    }
    
    func setupTextView() {
        habitsName.backgroundColor = viewColor.withAlphaComponent(0.5)
        habitsName.textAlignment = .center
        habitsName.font = UIFont(name: Fonts.titleHabitFont, size: 20)
        
        habitsMotivation.backgroundColor = viewColor.withAlphaComponent(0.5)
        habitsMotivation.textAlignment = .center
        habitsMotivation.font = UIFont(name: Fonts.motivationHabitFont, size: 20)
        
        // почему-то это так и не заработало...
        //habitInfoView.addSubview(habitsMotivation)
        //habitInfoView.addSubview(habitsName)
        //view.addSubview(habitInfoView)
        //        acceptHabitButton.setTitle("Done Habit", for: .normal)
        //        acceptHabitButton.tintColor = .black
        //        acceptHabitButton.frame = CGRect(
        //            x: habitsMotivation.frame.size.width/2 - acceptHabitButton.frame.size.width/2,
        //            y: habitsMotivation.frame.size.height/2 - acceptHabitButton.frame.size.height/2,
        //            width: acceptHabitButton.frame.size.width,
        //            height: acceptHabitButton.frame.size.height
        //        )
        setupAcceptButton()
        view.addSubview(habitsMotivation)
        view.addSubview(habitsName)
        view.addSubview(acceptHabitButton)
    }
    
    func setupAcceptButton() {
        acceptHabitButton = UIButton(type: .roundedRect)
        acceptHabitButton.frame.size.width = 200
        acceptHabitButton.frame.size.height = 50
        acceptHabitButton.setTitle("Accept Habit", for: .normal)
        acceptHabitButton.addTarget(self, action: #selector(acceptClicked), for: .touchUpInside)
        acceptHabitButton.center.x = view.frame.midX
        acceptHabitButton.center.y = view.frame.midY + 100
    }
    
    @objc func acceptClicked() {
        let habitListVC = HabitsListViewController()
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatConst.dateFormat
        let curDate = Date()
        dates.append(formatter.string(from: curDate))
        habit.checkInDates = dates
        // update dates
        for h in habitListVC.habits {
            if h.habitName == habit.habitName {
                h.checkInDates = dates
            }
        }
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
        NSLayoutConstraint.activate([
            habitInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitInfoView.widthAnchor.constraint(equalTo: view.widthAnchor),
            habitInfoView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2.5)
        ])
    }
    
    func setTextViewConstraints() {
        habitsName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            habitsName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitsName.widthAnchor.constraint(equalTo: view.widthAnchor),
            habitsName.heightAnchor.constraint(equalToConstant: view.frame.size.height / 4.0)
        ])
        
        
        habitsMotivation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            habitsMotivation.topAnchor.constraint(greaterThanOrEqualTo: habitsName.bottomAnchor),
            habitsMotivation.widthAnchor.constraint(equalTo: view.widthAnchor),
            habitsMotivation.heightAnchor.constraint(equalToConstant: view.frame.size.height / 4.0)
        ])
    }
    
    func setCalendarConstraints() {
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: habitsMotivation.bottomAnchor),
            calendar.widthAnchor.constraint(equalTo: view.widthAnchor),
            calendar.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2.5)
        ])
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatConst.dateFormat
        let curDate = Date()
        if formatter.string(from: date) == formatter.string(from: curDate) {
            // trash...
            cell.shapeLayer.backgroundColor = viewColor.withAlphaComponent(0.5).cgColor
        }
    }
    
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatConst.dateFormat
        if dates.contains(formatter.string(from: date)) {
            return UIColor.purple
        }
        return UIColor.clear
    }
    
}
