//
//  HomeViewController.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 01/04/2023.
//

import UIKit
import SnapKit
import FSCalendar

class HomeViewController: UIViewController {
    
    private lazy var myTaskLabel: UILabel  = {
        let label = UILabel()
        label.text = "My task"
        label.textColor = .black
        label.font = .systemFont(ofSize: 35, weight: .bold)
        return label
    }()
    
    private lazy var profileImage: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .orange
        imageV.layer.cornerRadius = 25
        imageV.layer.masksToBounds = true
        return imageV
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchB = UISearchBar()
        searchB.layer.borderWidth = 0.5
        searchB.layer.borderColor = UIColor.black.cgColor
        searchB.backgroundColor = .white
        searchB.backgroundImage = UIImage()
        searchB.autocorrectionType = .no
        searchB.layer.cornerRadius = 14
        searchB.searchTextField.backgroundColor = .white
        searchB.placeholder = "Search"
        return searchB
    }()
    
    private lazy var calendarV: FSCalendar = {
        let calendarV = FSCalendar()
        calendarV.scope = .week
        calendarV.headerHeight = 0
        return calendarV
    }()
    
    private lazy var tasksTable: UITableView = {
        let table = UITableView()
        table.register(TaskTableCell.self, forCellReuseIdentifier: TaskTableCell.identifier)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupconstraints()
    }
    
    private func setupconstraints(){
        view.backgroundColor = .white
        
        view.addSubview(myTaskLabel)
        
        myTaskLabel.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(56)
        }
        
        view.addSubview(profileImage)
        profileImage.snp.makeConstraints { make in
            make.centerY.equalTo(myTaskLabel)
            make.trailing.equalTo(-25)
            make.height.width.equalTo(50)
        }
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(myTaskLabel)
            make.trailing.equalTo(profileImage.snp.trailing)
            make.height.equalTo(44)
            make.top.equalTo(profileImage.snp.bottom).offset(19)
        }
        
        view.addSubview(calendarV)
        calendarV.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(searchBar.snp.bottom).offset(35)
            make.height.equalTo(120)
        }
        
        view.addSubview(tasksTable)
        tasksTable.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(calendarV.snp.bottom)
        }
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TaskTableCell()
        cell.separatorInset = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 115)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

