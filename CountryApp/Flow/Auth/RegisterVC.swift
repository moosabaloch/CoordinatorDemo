//
//  RegisterVC.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol RegisterProtocol {
    var onRegisterComplete : (()-> Void)? {get set}
    var onBack : (()-> Void)? {get set}
}

class RegisterVC: UIViewController , RegisterProtocol {
    var onRegisterComplete: (() -> Void)?
    
    var onBack: (() -> Void)?
    

    
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
