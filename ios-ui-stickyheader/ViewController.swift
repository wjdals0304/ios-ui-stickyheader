//
//  ViewController.swift
//  ios-ui-stickyheader
//
//  Created by 김정민 on 2022/05/10.
//

import UIKit

final class ViewController: UIViewController {
    
    lazy var customTableView = CustomTableView(frame: self.view.frame)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = customTableView
        self.customTableView.tableView.delegate = self
        self.customTableView.tableView.dataSource = self
        self.customTableView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TextCell")
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if section == 0 {
        return 1
      } else {
        return 4
      }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell") else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = .white
        cell.textLabel?.text = "Section: \(indexPath.section), Row: \(indexPath.row)"
        cell.textLabel?.textColor = .black
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView(frame: .zero)
        } else {
            let headerView = UIView()
            headerView.backgroundColor = .red
            headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
            
            let titleLabel = UILabel()
            titleLabel.textColor = .white
            titleLabel.text = "Section1 헤더 뷰"
            titleLabel.frame = CGRect(x: 0, y: 0, width: headerView.frame.width, height: headerView.frame.height)
            headerView.addSubview(titleLabel)
            
            return headerView
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = 200 - self.customTableView.navigationView.frame.height
        
        if scrollView.contentOffset.y > offset {
            scrollView.contentInset = UIEdgeInsets(top: self.customTableView.navigationView.frame.height, left: 0, bottom: 0, right: 0)
            
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

