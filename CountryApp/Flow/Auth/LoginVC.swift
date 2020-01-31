//
//  LoginVC.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol LoginProtocol :BaseViewControllerProtocol{
    var onLoginComplete : Closure? { get set }
}

class LoginVC: UIViewController , LoginProtocol {
    
    var onNavigationBackButtonTap: Closure?
    var onLoginComplete: Closure?
    var onBack: Closure?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSwipeBackNavigation()
    }
    
    @IBAction private func onBackTap(_ sender : AnyObject) {
        self.onBack?()
    }
    
    @IBAction private func onLoginTap(_ sender : AnyObject){
        self.onLoginComplete?()
    }
}
