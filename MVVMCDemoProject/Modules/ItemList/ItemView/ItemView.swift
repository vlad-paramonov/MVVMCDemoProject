//
//  ItemView.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 27.01.2022.
//

import UIKit
import RxSwift
import RxCocoa
import RXDataSourceConfigurator
import SnapKit

class ItemView: UIView {

    struct Model {
        let id: String
        let name: String
    }

    var model: Model? {
        didSet {
            updateUI()
        }
    }
    
    struct Output {
        let tap = PublishRelay<Void>()
    }
    
    let output = Output()
    
    private let bag = DisposeBag()
    private let label = UILabel()
    private let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
}

private extension ItemView {
    
    func configure() {
        configureView()
        addSubviews()
        setupConstraints()
        configureRx()
    }
    
    func configureView() {
        backgroundColor = .systemYellow
        layer.cornerRadius = 20
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
    }
    
    func addSubviews() {
        addSubview(label)
        addSubview(button)
    }
    
    func setupConstraints() {
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureRx() {
        button.rx.tap.debug("rx.tap").bind(to: output.tap).disposed(by: bag)
    }
    
    func updateUI() {
        guard let model = model else {
            return
        }
        label.text = model.name
    }
    
}

extension ItemView.Model: DiffIdentifiable {
    
    var diffIdentifier: String {
        "\(id)\(name)"
    }
    
}
