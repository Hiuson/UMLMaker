//
//  StickerContainerView.swift
//  UMLMaker
//
//  Created by zhouchun on 2021/12/2.
//

import UIKit
import RxSwift
import RxCocoa

//@objc class PositionInfo: NSObject {
//    @objc dynamic var center = CGPoint()
//    @objc dynamic var size = CGSize()
////    @objc dynamic var scale: CGFloat = 1.0
//}

@objc class StickerContainerViewModel: NSObject {
    @objc dynamic var center = CGPoint()
//    @objc dynamic var size = CGSize()
}

class StickerContainerView: UIView {

    private(set) var viewModel: StickerContainerViewModel
    private(set) var contentView: UIView
    
    var disposeBag = DisposeBag()
    
    init(contentView: UIView, viewModel: StickerContainerViewModel = StickerContainerViewModel()) {
        self.viewModel = viewModel
        self.contentView = contentView
        super.init(frame: CGRect())
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bind(viewModel)
        setupGestures()
    }
    
    func setupGestures() {
        let trainsitionPan = UIPanGestureRecognizer()
        addGestureRecognizer(trainsitionPan)
        trainsitionPan.rx.event.subscribe(onNext: { [weak self] recognizer in
            guard let `self` = self else {
                return
            }
            
            let originalCenter = self.viewModel.center
            let translation = recognizer.translation(in: self)
            self.viewModel.center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y + translation.y)
            
            recognizer.setTranslation(CGPoint(), in: self)
        }).disposed(by: disposeBag)
    }
    
    var currentVMDisposeBag = DisposeBag()
    func bind(_ viewModel: StickerContainerViewModel) {
        currentVMDisposeBag = DisposeBag()
        self.viewModel = viewModel
        
//        viewModel.rx.observe(CGSize.self, #keyPath(StickerContainerViewModel.size)).subscribe(onNext: { [weak self] _ in
//            self?.invalidateIntrinsicContentSize()
//        }).disposed(by: currentVMDisposeBag)
    }
    
    override var intrinsicContentSize: CGSize {
        return contentView.intrinsicContentSize
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
