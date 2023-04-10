//
//  DetailViewController.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 10/04/2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private lazy var taskTitle: UILabel = {
        let label = UILabel()
        label.text = "Task Title"
        label.font = .systemFont(ofSize: 32, weight: .black)
        label.textColor = .white
        return label
    }()
    
    private lazy var titleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 70/255, green: 91/255, blue: 227/255, alpha: 1)
        view.layer.cornerRadius = 23
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()

    private lazy var contrainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let dateP = UIDatePicker()
        let calendarGregorian = Calendar(identifier: .gregorian)
        dateP.calendar = calendarGregorian
        return dateP
    }()
    
    private lazy var descriptionField: UITextField = {
        let textF = UITextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width / 1.5, height: 40))
        textF.placeholder = "Task Name"
        textF.autocorrectionType = .no
        textF.font = .systemFont(ofSize: 22, weight: .bold)
        
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textF.frame.height - 1, width: textF.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textF.borderStyle = UITextField.BorderStyle.none
        textF.layer.addSublayer(bottomLine)
        return textF
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupconstraints()
        
    }
    
    
    public func fetchData(title: String?){
        DispatchQueue.main.async {
            self.taskTitle.text = title
            self.descriptionField.text = title
        }
    }
    
    private func setupconstraints(){
        view.backgroundColor = .white
        
        view.addSubview(titleContainer)
        titleContainer.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.height.equalTo(50)
        }
        
        view.addSubview(contrainerView)
        contrainerView.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(titleContainer.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-80)
        }
        
        
        titleContainer.addSubview(taskTitle)
        taskTitle.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }

        contrainerView.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        contrainerView.addSubview(descriptionField)
        descriptionField.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(50)
        }

    }
}
