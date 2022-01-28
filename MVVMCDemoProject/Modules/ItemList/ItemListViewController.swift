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
    
    let dsConfigurator = RXDataSourceConfigurator()
    
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
        title = "Nice"
        setTransparentBackground()
    }
    
    private func configure(bindings: ItemListViewModel.Bindings) {
        let dataSource = dsConfigurator.tableDataSource()
        bindings.cellModels
            .filterNil()
            .map({ $0 as [BaseCellModel] })
            .wrapToSection()
            .bind(to: customView.tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
    }
    
    private func configure(commands: ItemListViewModel.Commands) {
        dsConfigurator.handle(action: ItemView.Action.self)
            .debug("tap handler")
            .map{ $0.id }
            .bind(to: commands.select)
            .disposed(by: bag)
    }
    
}

private extension ItemListViewController {
    
    func setTransparentBackground() {
        var bgConfig = UIBackgroundConfiguration.listPlainCell()
        bgConfig.backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundConfiguration = bgConfig
    }
    
}
