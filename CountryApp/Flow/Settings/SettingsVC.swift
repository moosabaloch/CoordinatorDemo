//
//  SettingsVC.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol SettingsProtocol : BaseViewControllerProtocol{
    var onLogoutTap : (()-> Void)? {get set}
}

class SettingsVC: UIViewController , SettingsProtocol {
    var onNavigationBackButtonTap: Closure?
    
    var onBack: Closure?
    
    var onLogoutTap: Closure?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSwipeBackNavigation()
    }

    @IBAction private func onLogoutButtonTap(_ sender : AnyObject){
        self.onLogoutTap?()
    }
}
