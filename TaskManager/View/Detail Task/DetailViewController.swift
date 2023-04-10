//
//  DetailViewController.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 10/04/2023.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupconstraints()
    }
    
    private func setupconstraints(){
        view.backgroundColor = .white
        title = "Detail View Controller"
    }
    
}
