//
//  ItemListView.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 26.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

class ItemListView: UIView {
    
    let tableView = UITableView()
    
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
        tableView.backgroundView?.backgroundColor = .clear
        tableView.backgroundColor = .systemPink
        tableView.separatorStyle = .none
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
