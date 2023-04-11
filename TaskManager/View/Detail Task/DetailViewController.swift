//
//  DetailViewController.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 10/04/2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private lazy var detailViewModel = DetailViewModel.shared
    
    weak var delegate: DetailViewModel?
    
    private lazy var taskTitle: UITextField = {
        let label = UITextField()
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
        textF.font = .systemFont(ofSize: 18, weight: .regular)
        
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textF.frame.height - 1, width: textF.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textF.borderStyle = UITextField.BorderStyle.none
        textF.layer.addSublayer(bottomLine)
        return textF
    }()
    
    private lazy var changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Update", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
        button.addTarget(self, action: #selector(changeDidTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupconstraints()
        bind()
    }
    
    private func bind(){
        detailViewModel.viewDidLoad()
        detailViewModel.task.bind { dataTask in
            DispatchQueue.main.async {
                self.taskTitle.text = dataTask.first?.title
                self.descriptionField.text = dataTask.first?.descr
            }
        }
    }
    
    private func setupconstraints(){
        view.backgroundColor = .white
        
        view.addSubview(titleContainer)
        titleContainer.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.height.equalTo(70)
        }
        
        view.addSubview(contrainerView)
        contrainerView.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(titleContainer.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-250)
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
            make.top.equalTo(75)
        }
        
        contrainerView.addSubview(changeButton)
        changeButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalTo(65)
            make.trailing.equalTo(-65)
            make.bottom.equalTo(-15)
        }
    }
    
    @objc func changeDidTapped(){
        guard let title = taskTitle.text else { return }
        guard let description = descriptionField.text else { return }
        
        
        let components = Calendar.current.dateComponents([.day, .month, .hour, .minute], from: .now)
        if let day = components.day, let month = components.month,
           let hour = components.hour, let minute = components.minute{
            detailViewModel.updateTask(title: title, description: description, hour: hour, minute: minute, day: day)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
