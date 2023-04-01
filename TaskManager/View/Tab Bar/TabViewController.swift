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
        button.frame = CGRect(x: (self.view.frame.width / 2) + 90, y: -10, width: 60, height: 60)
        button.layer.cornerRadius = 21
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var middleButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: (self.view.frame.width / 2) - 30, y: -10, width: 60, height: 60)
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        button.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(middleButtonTapped), for: .touchUpInside)
        button.tintColor = .gray
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar(){
        viewControllers = [
            generateVC(vc: HomeViewController(), image: UIImage(systemName: "house.fill"), title: "Home"),
            generateVC(vc: CalendarViewController(), image: UIImage(), title: ""),
            generateVC(vc: TaskViewController(), image: UIImage(), title: "")
        ]
    }
    
    private func generateVC(vc: UIViewController, image: UIImage?, title: String) -> UIViewController{
        vc.tabBarItem.image = image
        vc.tabBarItem.title = title
        return vc
    }
    
    private func setTabBarAppearance(){
        let positionY: CGFloat = -14
        let positionX: CGFloat = 55
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height - positionY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionX, y: positionY - 5, width: width, height: height), cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        roundLayer.fillColor = UIColor(red: 248/255, green: 248/255, blue: 250/255, alpha: 1).cgColor
        tabBar.itemSpacing = 50
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.addSubview(createNewTaskButton)
        tabBar.addSubview(middleButton)
    }
    
    //MARK: Middle Button Index
    @objc func middleButtonTapped(){
        selectedIndex = 1
        
    }
    
    //MARK: Create Button Index
    @objc func createButtonTapped(){
        selectedIndex = 2
    }
    
}



