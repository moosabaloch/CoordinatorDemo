//
//  ChooseLoginOrRegisterVC.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol ChooseLoginOrRegisterProtocol {
    var onLogin : (()->Void)? {get set}
    var onRegister : (()->Void)? {get set}
}


class ChooseLoginOrRegisterVC: UIViewController , ChooseLoginOrRegisterProtocol {
    var onLogin: (() -> Void)?
    
    var onRegister: (() -> Void)?
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func onLoginTap(_ sender : AnyObject){
        self.onLogin?()
    }
    
    @IBAction func onRegisterTap(_ sender : AnyObject){
        self.onRegister?()
    }
}
