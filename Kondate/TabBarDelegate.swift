//
//  TabBarDelegate.swift
//  Kondate
//
//  Created by ryusei3 on 2017/03/01.
//  Copyright © 2017年 ryusei wakasa. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarDelegate {
    
    func didSelectTab(_ tabBarController: TabBarController)
}

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is TabBarDelegate {
            let v = viewController as! TabBarDelegate
            v.didSelectTab(self)
        } else if viewController is UINavigationController && (viewController as! UINavigationController).viewControllers[0] is TabBarDelegate {
            let v = (viewController as! UINavigationController).viewControllers[0] as! TabBarDelegate
            v.didSelectTab(self)
        }
    }
}
