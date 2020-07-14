//
//  HabitCell.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/14/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

import UIKit

class HabitCell: UITableViewCell {

    var habitTitleLabel = UILabel()
    var habitTypeView = DrawCircle()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(habitTitleLabel)
        addSubview(habitTypeView)
        
        setupHabitTypeView()
        setupHabitTitleLabel()
        setHabitTypeViewConstaints()
        setHabitTitleLabelConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(habit: Habit){
        let shapeLayer = CAShapeLayer()
        var path = UIBezierPath()
        var color = UIColor()
        path = UIBezierPath(ovalIn: CGRect(x: 15, y: 15, width: 40, height: 40))
        shapeLayer.path = path.cgPath
        switch habit.habitType {
            case .relaxing:
                color = UIColor.green
            case .sporty:
                color = UIColor.red
            case .intelligently:
                color = UIColor.blue
            case .healthy:
                color = UIColor.yellow
        }
        shapeLayer.fillColor = color.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 2.0
        habitTypeView.layer.addSublayer(shapeLayer)
        habitTitleLabel.text = habit.habitName
    }
    
    func setupHabitTitleLabel() {
        habitTitleLabel.numberOfLines               = 0
        habitTitleLabel.adjustsFontSizeToFitWidth   = true
    }
    
    func setupHabitTypeView() {
        habitTypeView.layer.cornerRadius    = 10
        habitTypeView.clipsToBounds         = true
    }
    
    func setHabitTypeViewConstaints() {
        habitTypeView.translatesAutoresizingMaskIntoConstraints                                             = false
        habitTypeView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                             = true
        habitTypeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive                = true
        habitTypeView.heightAnchor.constraint(equalToConstant: 80).isActive                                 = true
        habitTypeView.widthAnchor.constraint(equalTo: habitTypeView.heightAnchor, multiplier: 1).isActive   = true
    }
    
    func setHabitTitleLabelConstaints(){
        habitTitleLabel.translatesAutoresizingMaskIntoConstraints                                             = false
        habitTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                             = true
        //habitTitleLabel.leadingAnchor.constraint(equalTo: habitTypeView.leadingAnchor, constant: 30).isActive = true
        habitTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive                                 = true
        habitTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive             = true
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
