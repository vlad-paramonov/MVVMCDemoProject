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

class ItemListViewController: UIViewController {
    
    // MARK: - Infrastructure
    var viewModel: ItemListViewModelProtocol!
    private let bag = DisposeBag()
    private lazy var customView: ItemListView = {
        let frame: CGRect = UIScreen.main.bounds
        let customView = ItemListView(frame: frame)//CGRect(x: 0, y: 0, width: 320, height: 480))
        return customView
    }()

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
    
    private func configure(bindings: ItemListViewModel.Bindings) {
        
    }
    
    private func configure(commands: ItemListViewModel.Commands) {
        
    }
    
}
