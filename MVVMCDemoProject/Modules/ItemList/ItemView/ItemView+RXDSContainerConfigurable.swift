//
//  ItemView+RXDSContainerConfigurable.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 27.01.2022.
//

import UIKit
import RxSwift
import RxCocoa
import RXDataSourceConfigurator

extension ItemView: RXDSContainerConfigurable {
    
    struct Action: CellAction {
        let id: String
    }
    
    func configure(with vm: ItemView.Model) {
        model = vm
    }
    
    func configure(actionHandler: CellActionHandler, ip: IndexPath, reuseBag: DisposeBag) {
        guard let model = model else {
            return
        }
        output.tap.debug("configure").map { Action(id: model.id) }.bind(to: actionHandler.action).disposed(by: reuseBag)
    }
    
    func contentInsets() -> UIEdgeInsets? {
        .init(top: 5, left: 10, bottom: 5, right: 10)
    }
    
}

