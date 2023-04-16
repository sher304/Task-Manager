//
//  TabViewController.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 02/04/2023.
//

import UIKit

class TabViewController: UITabBarController {
    
    private lazy var createNewTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.frame = CGRect(x: (self.view.frame.width / 2), y: -10, width: 60, height: 60)
        button.layer.cornerRadius = 21
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar(){
        viewControllers = [
            generateVC(vc: HomeViewController(), image: UIImage(systemName: "house.fill"), title: ""),
            generateVC(vc: TaskViewController(), image: UIImage(systemName: "plus"), title: "")
        ]
    }
    
    private func generateVC(vc: UIViewController, image: UIImage?, title: String) -> UIViewController{
        vc.tabBarItem.image = image
        vc.tabBarItem.title = title
        return vc
    }
    
    private func setTabBarAppearance(){
        //MARK: TO Draw Tapbar
        let roundLayer = CAShapeLayer()
        
        //MARK: Position Y from top of screen to top of tabBar
        let bazierPath = UIBezierPath(roundedRect: CGRect(x: tabBar.bounds.minX + 92, y: tabBar.bounds.minY - 5, width: tabBar.bounds.width / 2, height: tabBar.bounds.height), cornerRadius: tabBar.bounds.height)
        
        roundLayer.path = bazierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        roundLayer.fillColor = UIColor.systemGray6.cgColor
        
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .black
        
    }
    
    //MARK: Create Button Index
    @objc func createButtonTapped(){
        selectedIndex = 1
    }
    
}



