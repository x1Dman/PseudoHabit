//
//  HabitViewController.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/15/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import UIKit

class HabitViewController: UIViewController {
    
    weak var delegate: HabitsListViewController?
    
    var habitNameTextField = UITextField()
    var habitTypeView = UIView()
    var habitMotivationTextField = UITextField()
    var acceptButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        setHabitNameTextField()
        setAcceptButton()
        setHabitTypeView()
        setHabitMotivationTextField()
        
        setNameTextFieldConstraints()
        setMotivationTextFieldConstaint()
        setTypeViewConstraints()
        setAcceptButtonConstraints()
    }
    
    
    func setAcceptButton() {
        acceptButton = UIButton(type: .roundedRect)
        acceptButton.setTitle("Accept", for: .normal)
        acceptButton.addTarget(self, action: #selector(acceptClicked), for: .touchUpInside)
        habitTypeView.addSubview(acceptButton)
    }
    
    func setHabitTypeView() {
        view.addSubview(habitTypeView)
        habitTypeView.backgroundColor = .blue
    }
    
    
    func setHabitNameTextField() {
        view.addSubview(habitNameTextField)
        habitNameTextField.text = "Type there your hobby"
        habitNameTextField.textAlignment = .center
        habitNameTextField.layer.borderColor = UIColor.black.cgColor
        habitNameTextField.borderStyle = .roundedRect
        habitNameTextField.backgroundColor = .white
    }
    
    func setHabitMotivationTextField() {
        view.addSubview(habitMotivationTextField)
        habitMotivationTextField.backgroundColor = .yellow
    }
    
    @IBAction func changeDataInFirstVC() {
        delegate?.update(habit: Habit(habitType: .relaxing, motivatingText: habitMotivationTextField.text, habitName: habitNameTextField.text!))
    }
    
    @objc func acceptClicked() {
        print("tapped")
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let sVC = sb.instantiateViewController(identifier: "HabitList") as? HabitsListViewController else { return }
        sVC.habits.append(Habit(habitType: .relaxing, motivatingText: habitMotivationTextField.text, habitName: habitNameTextField.text!))
        //show(sVC, sender: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    // constraints
    func setNameTextFieldConstraints () {
        habitNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                habitNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                habitNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                habitNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                habitNameTextField.heightAnchor.constraint(equalToConstant: 200),
                habitNameTextField.bottomAnchor.constraint(equalTo: habitMotivationTextField.topAnchor)
            ]
        )
    }
    
    func setMotivationTextFieldConstaint() {
        habitMotivationTextField.translatesAutoresizingMaskIntoConstraints = false
        habitMotivationTextField.topAnchor.constraint(equalTo: habitNameTextField.bottomAnchor).isActive = true
        habitMotivationTextField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        habitMotivationTextField.bottomAnchor.constraint(equalTo: habitTypeView.topAnchor).isActive = true
        habitMotivationTextField.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setTypeViewConstraints() {
        habitTypeView.translatesAutoresizingMaskIntoConstraints = false
        habitTypeView.topAnchor.constraint(equalTo: habitMotivationTextField.bottomAnchor).isActive = true
        habitTypeView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        habitTypeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setAcceptButtonConstraints() {
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.bottomAnchor.constraint(equalTo: habitTypeView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        acceptButton.widthAnchor.constraint(equalTo: habitTypeView.widthAnchor).isActive = true
        acceptButton.topAnchor.constraint(equalTo: habitTypeView.topAnchor, constant: 200).isActive = true
    }

}
