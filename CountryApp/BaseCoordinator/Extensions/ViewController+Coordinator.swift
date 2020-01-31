//
//  ViewController+Coordinator.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

// MARK: Presentable Implementation
extension UIViewController: Presentable , Storyboarded {
    
    func toPresent() -> UIViewController? {
        return self
    }
}


// MARK: Swipe to Back Navigation Controller
extension UIViewController : UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func setSwipeBackNavigation(_ swipeable : Bool = true) {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = swipeable
    }
}

// MARK: Init VC from Storyboards with viewController static func instatiate
protocol Storyboarded {
    static func instantiate(storyboard : UIStoryboard ) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboard : UIStoryboard) -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

