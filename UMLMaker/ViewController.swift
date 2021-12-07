//
//  ViewController.swift
//  UMLMaker
//
//  Created by zhouchun on 2021/12/1.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let canvasSize = CGSize(width: 2000, height: 2000)
    
    let scrollView = UIScrollView()
    let canvasView = CanvasView()
    let toolbar = Toolbar()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupScrollView()
        setupToolbar()
        
        view.addSubview(scrollView)
        view.addSubview(toolbar)
        
        setupConstraints()
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .black)
        label.text = "Template"
        canvasView.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func setupScrollView() {
        scrollView.maximumZoomScale = 5
        scrollView.minimumZoomScale = 0.2
        scrollView.delegate = self
        scrollView.contentSize = canvasSize
        
        scrollView.addSubview(canvasView)
    }
    
    func setupToolbar() {
        toolbar.addButton.rx.tap.subscribe(onNext: {[weak self] in
            self?.addClassSticker()
        }).disposed(by: disposeBag)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        canvasView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.size.equalTo(canvasSize)
        }
        
        toolbar.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(60);
        }
    }
    
    //Functions
    func addClassSticker() {
        let contentView = ClassStickerView()
        let center = view.convert(view.center, to: canvasView)
        let viewModel = StickerContainerViewModel()
        viewModel.center = center
//        viewModel.size = CGSize(width: 200, height: 140)
        let sticker = StickerContainerView(contentView: contentView, viewModel: viewModel)
        canvasView.addSticker(sticker)
    }
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        if scrollView == self.scrollView {
            return canvasView
        }
        return nil
    }
    
//    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//        if scrollView == self.scrollView {
//            var center = scrollView.center
//            if canvasView.frame.width < scrollView.bounds.width {
//                center.x = scrollView.bounds.width / 2
//            }
//
//            if canvasView.frame.height < scrollView.bounds.height {
//                center.y = scrollView.bounds.height / 2
//            }
//
//            print(center)
//            canvasView.center = center
//        }
//    }
}
