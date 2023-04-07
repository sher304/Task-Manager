//
//  TaskTableCell.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 01/04/2023.
//

import UIKit
import SnapKit

class TaskTableCell: UITableViewCell{
    
    static let identifier = "CustomTaskCell"
    
    private lazy var taskNumber: UILabel = {
        let label = UILabel()
        label.text = "Task 1"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        return label
    }()
    
    private lazy var taskTitle: UILabel = {
        let label = UILabel()
        label.text = "Wireframe"
        label.font = .systemFont(ofSize: 16, weight: .thin)
        return label
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 250/255, alpha: 1)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 33 / 2
        button.addTarget(self, action: #selector(taskDidDone), for: .touchUpInside)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
            setupconstraint()
    }
    
    public func fillData(title: String, numberTask: String){
        DispatchQueue.main.async {
            self.taskTitle.text = title
            self.taskNumber.text = numberTask
        }
    }
    
    private func setupconstraint(){
        contentView.addSubview(taskNumber)
        taskNumber.snp.makeConstraints { make in
            make.leading.equalTo(35)
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(taskTitle)
        taskTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(taskNumber.snp.trailing).offset(36)
        }
        
        contentView.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-32)
            make.height.width.equalTo(33)
        }
    }
    
    @objc func taskDidDone(){
        doneButton.isSelected = !doneButton.isSelected
        if doneButton.isSelected{
            animateButtonFill()
        }else{
            animateButtonFill()
            
        }
    }
    
    private func animateButtonFill(){
        if doneButton.isSelected{
            UIView.animate(withDuration: 0.5) {
                self.doneButton.backgroundColor = .black
                self.doneButton.tintColor = .white
                self.doneButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
                self.taskNumber.textColor = UIColor(red: 26/255, green: 161/255, blue: 80/255, alpha: 0.6)
                let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "Wireframe")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                self.taskTitle.attributedText = attributeString
            }
        }else{
            UIView.animate(withDuration: 0.5) {
                self.doneButton.backgroundColor = .white
                self.doneButton.setImage(UIImage(), for: .normal)
                self.taskNumber.textColor = .black
                let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "Wireframe")
                    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 0, range: NSRange(location: 0, length: attributeString.length))
                self.taskTitle.attributedText = attributeString
            }
        }
    }
}
