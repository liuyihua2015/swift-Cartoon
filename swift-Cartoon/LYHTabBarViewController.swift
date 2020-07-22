//
//  HZTabBarViewController.swift
//  swift-Cartoon
//
//  Created by Yihua Liu on 2020/7/22.
//  Copyright © 2020 Yihua Liu. All rights reserved.
//

import UIKit

class LYHTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        setupLayout();
       
    }
    
    
    func setupLayout() {
        
        
        //1.首页
//
        let onepageVC = LYHMineController()

        addChildController(onepageVC, title: "首页", image: UIImage(named: "tab_home"),
                            selectedImage: UIImage(named: "tab_home_S"))

        let twopageVC = LYHCateViewController()
         addChildController(twopageVC, title: "分类", image: UIImage(named: "tab_class"),
                            selectedImage: UIImage(named: "tab_class_S"))

        let threepageVC = LYHBookViewController()
         addChildController(threepageVC, title: "书架", image: UIImage(named: "tab_book"),
                            selectedImage: UIImage(named: "tab_book_S"))

        let fourpageVC = LYHMineController()
         addChildController(fourpageVC, title: "我的", image: UIImage(named: "tab_mine"),
                            selectedImage: UIImage(named: "tab_mine_S"))
        
        
    }
    
    func addChildController(_ childController:UIViewController, title: String?,
                            image: UIImage?,selectedImage: UIImage?)  {
        
//        childController.title = title
        
        childController.tabBarItem = UITabBarItem(title: title, image: image?.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            
            
        }

        
        addChild(UINavigationController(rootViewController: childController))

        
    }

 

}
