//
//  CustomTableView.swift
//  ios-ui-stickyheader
//
//  Created by 김정민 on 2022/05/10.
//

import UIKit
import SnapKit

final class CustomTableView: UIView {
    
    let navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        return view
    }()
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.estimatedSectionHeaderHeight = 50
        tableView.rowHeight = 200
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        return tableView
    }()
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        
        [
            self.tableView,
            self.navigationView
        ].forEach { self.addSubview($0) }
        
        navigationView.snp.makeConstraints { make in
            make.leading.top.right.equalToSuperview()
            make.bottom.equalTo(self.snp.top).offset(100)
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }
    
}

