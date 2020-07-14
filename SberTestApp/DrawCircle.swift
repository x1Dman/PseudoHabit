//
//  DrawCircle.swift
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/14/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

//import UIKit
//
//@IBDesignable
//class DrawCircle: UIView {
//    func drawCircle (_ rect: CGRect, color: UIColor){
//        var path = UIBezierPath()
//        path = UIBezierPath(ovalIn: CGRect(x: 15, y: 15, width: 40, height: 40))
//        color.setStroke()
//        color.setFill()
//        path.lineWidth = 5
//        path.stroke()
//        path.fill()
//    }
//}

import UIKit

@IBDesignable
class DrawCircle: UIView {
    func drawCircle (_ rect: CGRect, color: UIColor){
        var path = UIBezierPath()
        path = UIBezierPath(ovalIn: CGRect(x: 15, y: 15, width: 40, height: 40))
        color.setStroke()
        color.setFill()
        path.lineWidth = 5
        path.stroke()
        path.fill()
    }
}

