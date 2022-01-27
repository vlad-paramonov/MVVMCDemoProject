//
//  ItemView+RXDSContainerConfigurable.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 27.01.2022.
//

import UIKit
import RxSwift
import RXDataSourceConfigurator

extension ItemView: RXDSContainerConfigurable {
    
    func configure(with vm: ItemView.Model) {
        model = vm
    }
    
    func configure(actionHandler: CellActionHandler, ip: IndexPath, reuseBag: DisposeBag) {
        guard let _ = model else {
            return
        }
    }
    
    func contentInsets() -> UIEdgeInsets? {
        .init(top: 5, left: 10, bottom: 5, right: 10)
    }
    
}


