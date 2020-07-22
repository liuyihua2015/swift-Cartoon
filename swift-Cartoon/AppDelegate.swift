//
//  AppDelegate.swift
//  swift-Cartoon
//
//  Created by Yihua Liu on 2020/7/22.
//  Copyright © 2020 Yihua Liu. All rights reserved.
//

import UIKit
import Alamofire
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?
    
   // 监测网络
    lazy var reachability:NetworkReachabilityManager? = {
        return NetworkReachabilityManager(host: "http://app.u17.com")
    }()
    
    // 申明手机屏幕旋转方向
    var orientation: UIInterfaceOrientationMask = .portrait


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 键盘处理
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        // 导航栏间距调整
        //        UINavigationSXFixSpace.shared.sx_defultFixSpace = 8
        //        UINavigationSXFixSpace.shared.sx_fixedSpaceWidth = -12
                
        // 配置
        setupBaseConfig()
        
        
//        主界面
        let vc = LYHTabBarViewController()
        vc.view.backgroundColor = UIColor.white
        window?.rootViewController = LYHTabBarViewController()
        window?.makeKeyAndVisible()
        
        
        return true
    }
    
    //基础配置文件
    func setupBaseConfig() {
        
        // 1.偏好设置: 性别缓存
        let defaults = UserDefaults.standard

        if (defaults.value(forKey: String.sexTypeKey) != nil) {
            
            defaults.set(1, forKey: String.sexTypeKey)
            
            defaults.synchronize()
            
        }
        
        // 2.网络监控
        reachability?.startListening(onUpdatePerforming: { (status) in
            
            switch status{

                case .unknown:
                ulog("主人,检测到您正在使用未知网络，注意安全哦~")
//                     UNoticeBar(config: UNoticeBarConfig(title: "主人,检测到您正在使用未知网络，注意安全哦~")).show(duration: 2)
                case .notReachable:
                ulog("主人,检测到无网络服务")
//                     UNoticeBar(config: UNoticeBarConfig(title: "主人,检测到无网络服务")).show(duration: 2)
                case .reachable(.cellular):
//                     UNoticeBar(config: UNoticeBarConfig(title: "主人,检测到您正在使用移动数据")).show(duration: 2)
                ulog("主人,检测到您正在使用移动数据")
                default:break
            }
            
           
          
            
            
            
        })
        
        // 3.支持屏幕旋转
        func appliction(_ appliction:UIApplication,supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask{
            return orientation;
        }
        
        
        
    }


}


extension UIApplication {
    // 4. 强制旋转屏幕
    class func changeOrientationTo(landscapeRight: Bool) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        if landscapeRight == true {
            delegate.orientation = .landscapeRight
            UIApplication.shared.supportedInterfaceOrientations(for: delegate.window)
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        } else {
            delegate.orientation = .portrait
            UIApplication.shared.supportedInterfaceOrientations(for: delegate.window)
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
}
