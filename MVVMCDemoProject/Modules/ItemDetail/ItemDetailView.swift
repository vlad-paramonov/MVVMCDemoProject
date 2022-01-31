//
//  ItemDetailView.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 27.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

class ItemDetailView: UIView {
    
    let label = UILabel()
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        configureView()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureView() {
        backgroundColor = .systemOrange
        label.font = UIFont.systemFont(ofSize: 70)
        label.textAlignment = .center
    }
    
    private func addSubviews() {
        addSubview(label)
    }
    
    private func makeConstraints() {
        label.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    
}
