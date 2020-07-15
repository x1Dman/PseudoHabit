//
//  HabitInfoViewController.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/15/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import FSCalendar
import UIKit

class HabitInfoViewController: UIViewController, FSCalendarDelegate {
    
    // only for habit
    var habitInfoView = UIView()
    var viewColor = UIColor()
    var habitsMotivation = UITextView()
    var habitsName = UITextView()
    
    // calendar
    var calendar = FSCalendar()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        setupView()
        setupCalendar()
        
        // constraints
        setViewConstraints()
        setTextConstraints()
        setCalendarConstraints()
    }
    
    func setupView() {
        habitInfoView.backgroundColor = viewColor.withAlphaComponent(0.5)
        habitsName.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        habitsName.backgroundColor = .blue
        view.addSubview(habitInfoView)
        habitInfoView.addSubview(habitsMotivation)
        habitInfoView.addSubview(habitsName)
    }
    
    func setupCalendar() {
        calendar.delegate = self
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
        habitsName.translatesAutoresizingMaskIntoConstraints = false
        habitsName.topAnchor.constraint(equalTo: habitInfoView.topAnchor).isActive = true
        habitsName.widthAnchor.constraint(equalTo: habitInfoView.widthAnchor).isActive = true
        habitsName.heightAnchor.constraint(equalToConstant: habitInfoView.frame.size.height / 2.0).isActive = true
        
        //
        habitsMotivation.translatesAutoresizingMaskIntoConstraints = false
        habitsMotivation.topAnchor.constraint(greaterThanOrEqualTo: habitsName.bottomAnchor, constant: 10).isActive = true
        habitsMotivation.widthAnchor.constraint(equalTo: habitInfoView.widthAnchor).isActive = true
        habitsMotivation.heightAnchor.constraint(equalToConstant: habitInfoView.frame.size.height / 2.0).isActive = true
        
    }
    
    func setCalendarConstraints() {
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.topAnchor.constraint(equalTo: habitInfoView.bottomAnchor).isActive = true
        calendar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2.5).isActive = true
        //calendar.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: view.bottomAnchor).isActive = true
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let formatterString = formatter.string(from: date)
        print("kek")
    }

}
