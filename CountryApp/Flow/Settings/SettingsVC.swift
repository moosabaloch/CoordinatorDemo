//
//  SettingsVC.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol SettingsProtocol {
    var onLogoutTap : (()-> Void)? {get set}
}

class SettingsVC: UIViewController , SettingsProtocol {
    var onLogoutTap: (() -> Void)?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func onLogoutButtonTap(_ sender : AnyObject){
        self.onLogoutTap?()
    }
}
