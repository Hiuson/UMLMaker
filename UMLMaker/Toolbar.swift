//
//  Toolbar.swift
//  UMLMaker
//
//  Created by zhouchun on 2021/12/2.
//

import UIKit
import SnapKit

class Toolbar: UIView {

    let containerStackView = UIStackView()
    
    let addButton = UIButton()
    
    let buttonSize = CGSize(width: 48, height: 48)
    let buttonSpacing: CGFloat = 12
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.gray.cgColor
        
        containerStackView.axis = .vertical
        containerStackView.alignment = .center
        containerStackView.distribution = .equalSpacing
        containerStackView.spacing = buttonSpacing

        addButton.setImage(UIImage(named: "add-box-line_48"), for: .normal)
        
        containerStackView.addArrangedSubview(addButton)
        
        addSubview(containerStackView)
        
        containerStackView.snp.makeConstraints { make in
            make.centerY.leading.trailing.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { make in
            make.size.equalTo(buttonSize)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
