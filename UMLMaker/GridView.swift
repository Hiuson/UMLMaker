//
//  GridView.swift
//  UMLMaker
//
//  Created by zhouchun on 2021/12/2.
//

import UIKit

class GridView: UIView {
    let grainSize: CGFloat = 50
    let lineDashPattern: NSNumber = 0
    
    let shapeLayer = CAShapeLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 0.5
//        shapeLayer.lineDashPattern = [lineDashPattern]
        
        layer.addSublayer(shapeLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shapeLayer.frame = layer.bounds
        
        let size = shapeLayer.bounds.size
        let path = UIBezierPath()
        
        var x: CGFloat = 0
        while x < size.width {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: size.height))
            x += grainSize
        }
        
        var y: CGFloat = 0
        while y < size.height {
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: size.width, y: y))
            y += grainSize
        }
        
        shapeLayer.path = path.cgPath
    }
}
