//
//  ItemListViewController.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 26.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RXDataSourceConfigurator

class ItemListViewController: UIViewController {
    
    // MARK: - Infrastructure
    var viewModel: ItemListViewModelProtocol!
    private let bag = DisposeBag()
    private lazy var customView = ItemListView(frame: .zero)

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
        customView.tableView.register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    private func configure(bindings: ItemListViewModel.Bindings) {
        viewModel.commands.data.bind(to: customView.tableView.rx.items(
                cellIdentifier: Cell.reuseIdentifier,
                cellType: Cell.self))
                { _, model, cell in
                    cell.textLabel?.text = "\(model)"
                }
                .disposed(by: bag)
    }
    
    private func configure(commands: ItemListViewModel.Commands) {
        
    }
    
}
