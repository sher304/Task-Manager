//
//  TaskViewController.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 02/04/2023.
//

import UIKit
import SnapKit

class TaskViewController: UIViewController {
    
    private lazy var containerOFTask: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let dateP = UIDatePicker()
        let calendarGregorian = Calendar(identifier: .gregorian)
        dateP.calendar = calendarGregorian
        return dateP
    }()
    
    private lazy var createNewTaskBG: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 70/255, green: 91/255, blue: 227/255, alpha: 1)
        return view
    }()
    
    private lazy var createNewTaskLabel: UILabel = {
        let label = UILabel()
        label.text = "Create New Task"
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var titleField: UITextField = {
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
    
    private lazy var descriptionField: UITextField = {
        let textF = UITextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width / 1.5, height: 40))
        textF.placeholder = "Description"
        textF.autocorrectionType = .no
        
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textF.frame.height - 1, width: textF.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textF.borderStyle = UITextField.BorderStyle.none
        textF.layer.addSublayer(bottomLine)
        return textF
    }()
    
    private lazy var createTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(red: 70/255, green: 91/255, blue: 227/255, alpha: 1)
        button.setTitle("Create Task", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        button.addTarget(self, action: #selector(createTaskTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .white
        
        view.addSubview(containerOFTask)
        containerOFTask.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-130)
        }
        
        containerOFTask.addSubview(createNewTaskBG)
        createNewTaskBG.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(80)
        }
        
        createNewTaskBG.addSubview(createNewTaskLabel)
        createNewTaskLabel.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.centerY.equalToSuperview()
        }
        
        containerOFTask.addSubview(titleField)
        titleField.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(createNewTaskBG.snp.bottom).offset(30)
        }
        
        containerOFTask.addSubview(descriptionField)
        descriptionField.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(titleField.snp.bottom).offset(80)
        }
        
        containerOFTask.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(descriptionField.snp.bottom).offset(90)
            make.centerX.equalToSuperview()
        }
        
        containerOFTask.addSubview(createTaskButton)
        createTaskButton.snp.makeConstraints { make in
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(40)
            make.bottom.equalTo(-30)
        }
        
    }
    
    
    @objc func createTaskTapped(){
        guard let title = titleField.text else { return }
        guard let description = descriptionField.text else { return }
        
        let components = Calendar.current.dateComponents([.day, .month, .hour, .minute], from: .now)
        if let day = components.day, let month = components.month,
           let hour = components.hour, let minute = components.minute{
            print("\(day) \(month) \(hour):\(minute)")
            print(title, description)
        }
    }
}
