//
//  CanvasView.swift
//  UMLMaker
//
//  Created by zhouchun on 2021/12/1.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CanvasView: UIView {
    let backgroundGridView = GridView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundGridView)
        
        backgroundGridView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addSticker(_ sticker: StickerContainerView) {
        addSubview(sticker)
        
        sticker.viewModel.rx.observe(CGPoint.self, #keyPath(StickerContainerViewModel.center)).subscribe(onNext: { [weak self, weak sticker] _ in
            guard let `self` = self, let sticker = sticker  else {
                return
            }
            self.updateStickerPosition(sticker)
        }).disposed(by: sticker.currentVMDisposeBag)
    }
    
    func updateStickerPosition(_ sticker: StickerContainerView) {
        sticker.snp.updateConstraints { make in
            make.center.equalTo(sticker.viewModel.center)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
