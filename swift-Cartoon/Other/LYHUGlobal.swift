//
//  LBUGlobal.swift
//  swift-Cartoon
//
//  Created by Yihua Liu on 2020/7/22.
//  Copyright © 2020 Yihua Liu. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit
import MJRefresh

//MARK:应用默认颜色
extension UIColor{
    
    class var background: UIColor {
        return UIColor(r: 242, g: 242, b: 242)
    }
    
    class var theme: UIColor {
        return UIColor(r: 29, g: 221, b: 43)
    }
    
}

extension String{
    
    static  let searchHistoryKey = "searchHistoryKey"
    static  let sexTypeKey = "sexTypeKey"
    
    
}

extension NSNotification.Name{
    
    static let USEXTyepeDidChage = NSNotification.Name("USEXTyepeDidChage")
    
}

let screenWidth = UIScreen.main.bounds.width
let screenHight = UIScreen.main.bounds.height


var isIphoneX: Bool{
    
    return UIDevice.current.userInterfaceIdiom == .phone && max(screenHight, screenWidth) >= 812
    
}

var topVC : UIViewController? {
    
    var resultVC : UIViewController?
    
    resultVC = _topVC(getkeywindows()?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    
    return resultVC;
    
}

private func getkeywindows() -> UIWindow? {
 
    var window:UIWindow? = nil
 
    if #available(iOS 13.0, *) {
 
        for windowScene:UIWindowScene in ((UIApplication.shared.connectedScenes as? Set<UIWindowScene>)!) {
            if windowScene.activationState == .foregroundActive {
                window = windowScene.windows.first
                break
            }
        }
        return window
    }else{
        return UIApplication.shared.keyWindow
    }
    
}


private func _topVC(_ vc:UIViewController?) -> UIViewController?{
    
    if vc is UINavigationController{
        return _topVC((vc as? UINavigationController)?.topViewController)
    }else if vc is UITableViewController{
        return _topVC((vc as? UITabBarController)?.selectedViewController)
    }else{
        return vc
    }

}

//MARK:print

func ulog<T>(_ message: T, file: String = #file, function: String = #function, lineNumber: Int = #line){
    
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):Func:\(function)Line:\(lineNumber)] - \(message)")
    
    #endif
    

}


//MARK: Kingfisher
//extension Kingfisher where Base: ImageView {
//    @discardableResult
//    public func setImage(urlString: String?, placeholder: Placeholder? = UIImage(named: "normal_placeholder_h")) -> RetrieveImageTask {
//        return setImage(with: URL(string: urlString ?? ""),
//                        placeholder: placeholder,
//                        options:[.transition(.fade(0.5))])
//    }
//}

//extension Kingfisher where Base: UIButton {
//    @discardableResult
//    public func setImage(urlString: String?, for state: UIControl.State, placeholder: UIImage? = UIImage(named: "normal_placeholder_h")) -> RetrieveImageTask {
//        return setImage(with: URL(string: urlString ?? ""),
//                        for: state,
//                        placeholder: placeholder,
//                        options: [.transition(.fade(0.5))])
//
//    }
//}

//MARK: SnapKit
extension ConstraintView {
    
    var usnp: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
}

extension UICollectionView {
    
    func reloadData(animation: Bool = true) {
        if animation {
            reloadData()
        } else {
            UIView .performWithoutAnimation {
                reloadData()
            }
        }
    }
}


