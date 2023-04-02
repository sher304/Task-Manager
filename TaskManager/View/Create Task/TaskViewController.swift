//
//  TaskViewController.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 02/04/2023.
//

import UIKit
import SnapKit

class TaskViewController: UIViewController {
    
    private lazy var datePicker: UIDatePicker = {
        let dateP = UIDatePicker()
        let calendarGregorian = Calendar(identifier: .gregorian)
        dateP.calendar = calendarGregorian
        dateP.addTarget(self, action: #selector(dateChanged), for: .valueChanged)

        return dateP
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .white
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
//        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        let components = Calendar.current.dateComponents([.day, .month, .hour, .minute], from: sender.date)
        if let day = components.day, let month = components.month,
           let hour = components.hour, let minute = components.minute{
            print("\(day) \(month) \(hour):\(minute)")
        }
    }

}
