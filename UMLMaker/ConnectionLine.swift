//
//  ConnectionLine.swift
//  UMLMaker
//
//  Created by zhouchun on 2021/12/7.
//

import UIKit

@objc class ConnectionLineModel: NSObject {
    var startPoint = CGPoint()
    var endPoint = CGPoint()
}

class ConnectionLine: UIView {
    
    let shapeLayer = CAShapeLayer()
    
    var viewModel: ConnectionLineModel
    
    init(viewModel: ConnectionLineModel = ConnectionLineModel()) {
        self.viewModel = viewModel
        
        super.init(frame: CGRect())
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = Common.lineWidth
        shapeLayer.strokeColor = Common.lineColor.cgColor
        
        layer.addSublayer(shapeLayer)
        
        self.bind(viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        shapeLayer.frame = layer.bounds
        
        let path = UIBezierPath()
        path.move(to: viewModel.startPoint)
        path.addLine(to: viewModel.endPoint)
    }
    
    func bind(_ viewModel: ConnectionLineModel) {
        self.viewModel = viewModel
    }
}
