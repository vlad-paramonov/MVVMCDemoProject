//
//  ItemDetailViewController.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 27.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ItemDetailViewController: UIViewController {
    
    // MARK: - Infrastructure
    var viewModel: ItemDetailViewModelProtocol!
    private let bag = DisposeBag()
    private lazy var customView = ItemDetailView(frame: .zero)

    // MARK: - View lifecycle
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configure(bindings: viewModel.bindings)
        configure(commands: viewModel.commands)
    }

    deinit {
        print("💀" + "\(type(of: self)) " + "dead")
    }
    
    // MARK: - Private
    
    private func configureUI() {
        
    }
    
    private func configure(bindings: ItemDetailViewModel.Bindings) {
        bindings.fruitEmoji.bind(to: customView.label.rx.text).disposed(by: bag)
    }
    
    private func configure(commands: ItemDetailViewModel.Commands) {
        
    }
    
}
