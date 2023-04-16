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
        
        let positionY: CGFloat = 14
        let positionX: CGFloat = 10
        
        let roundLayer = CAShapeLayer()
        
        //MARK: TO Draw Tapbar
        
        //MARK: Position Y from top of screen to top of tabBar
        let bazierPath = UIBezierPath(roundedRect: CGRect(x: positionX, y: tabBar.bounds.minX - positionY, width: tabBar.bounds.width - positionX * 2, height: tabBar.bounds.height + positionY * 2), cornerRadius: tabBar.bounds.height / 2)
        
        roundLayer.path = bazierPath.cgPath
        roundLayer.fillColor = UIColor.systemGray6.cgColor
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
    }
    
    //MARK: Create Button Index
    @objc func createButtonTapped(){
        selectedIndex = 1
    }
    
}



