//
//  RegisterVC.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol RegisterProtocol : BaseViewControllerProtocol{
    var onRegisterComplete : Closure? {get set}
}

class RegisterVC: UIViewController , RegisterProtocol {
    
    var onNavigationBackButtonTap: Closure?
    var onRegisterComplete: Closure?
    var onBack: Closure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func onBackButtonTap(_ sender : AnyObject ){
        self.onBack?()
    }

    @IBAction private func onRegisterButtonTap(_ sender : AnyObject ){
        self.onRegisterComplete?()
    }

}
