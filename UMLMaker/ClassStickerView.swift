//
//  ClassStickerView.swift
//  UMLMaker
//
//  Created by zhouchun on 2021/12/2.
//

import UIKit
import RxSwift
import RxCocoa

func DefaultTextView() -> UITextView {
    let textView = UITextView()
    textView.text = " "
    textView.isScrollEnabled = false
    textView.layer.borderWidth = 1
    textView.layer.borderColor = UIColor.red.cgColor
    return textView
}

func DefaultSplitLine() -> UIView {
    let line = UIView()
    line.backgroundColor = .black
    return line
}

class ClassStickerView: UIView {
//    let backgroundView = CommonRoundedView()
    
    let nameTextView = DefaultTextView()
    let propertyTextView = DefaultTextView()
    let methodTextView = DefaultTextView()
     
//    let splitLines = UIView()
    
    let containerStackView = UIStackView()
    
    let disposeBag = DisposeBag()
    
    var textViews: Array<UITextView> {
        return [nameTextView, propertyTextView, methodTextView]
    }
//
//    var textViews: Array<UIView> {
//        return [nameTextView, propertyTextView, methodTextView]
//    }
    
    let horiMargin: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.borderColor = Common.lineColor.cgColor
        layer.borderWidth = Common.lineWidth
        layer.cornerRadius = 20
        
        containerStackView.axis = .vertical
        containerStackView.spacing = 8
        containerStackView.alignment = .center
        
        
//        addSubview(backgroundView)
//        backgroundView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
        
        let lines = [DefaultSplitLine(), DefaultSplitLine()]
        
        containerStackView.addArrangedSubview(nameTextView)
        containerStackView.addArrangedSubview(lines[0])
        containerStackView.addArrangedSubview(propertyTextView)
        containerStackView.addArrangedSubview(lines[1])
        containerStackView.addArrangedSubview(methodTextView)
        addSubview(containerStackView)
        
        for line in lines {
            line.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(2.0)
            }
        }
        
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
        }
        
        snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(200)
        }
        
        for textView in textViews {
            textView.snp.makeConstraints { make in
                make.width.equalToSuperview().offset(-2*self.horiMargin)
                make.height.equalTo(20)
            }
            textView.rx.text.subscribe(onNext: { [weak self] (text) in
                guard let `self` = self else {
                    return
                }
                let size = textView.sizeThatFits(CGSize(width: self.bounds.size.width - 2*self.horiMargin, height: CGFloat.greatestFiniteMagnitude))
                print(size)
                textView.snp.updateConstraints { make in
                    make.height.equalTo(max(size.height, 20))
                }
            }).disposed(by: disposeBag)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
