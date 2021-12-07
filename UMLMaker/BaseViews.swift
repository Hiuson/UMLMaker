//
//  BaseViews.swift
//  UMLMaker
//
//  Created by zhouchun on 2021/12/2.
//

import UIKit

class CommonRoundedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIView {
    var size: CGSize {
        return bounds.size
    }
    
    var height: CGFloat {
        return size.height
    }
    
    var leftPoint: CGPoint {
        return CGPoint(x: 0, y: size.height / 2)
    }
    
    var rightPoint: CGPoint {
        return CGPoint(x: size.width, y: size.height / 2)
    }
    
    var topPoint: CGPoint {
        return CGPoint(x: size.width / 2, y: 0)
    }
    
    var bottomPoint: CGPoint {
        return CGPoint(x: size.width / 2, y: size.height)
    }
}

class Common {
    static var lineWidth: CGFloat {
        return 2.0
    }
    
    static var lineColor: UIColor {
        return .black
    }
}
