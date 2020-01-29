//
//  LoginVC.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol LoginProtocol {
    var onLoginComplete : (()-> Void)? { get set }
    var onBack : (()->Void)? {get set}
}

class LoginVC: UIViewController , LoginProtocol {
    var onLoginComplete: (() -> Void)?
    
    var onBack: (() -> Void)?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction private func onBackTap(_ sender : AnyObject) {
        self.onBack?()
    }
    
    
    @IBAction private func onLoginTap(_ sender : AnyObject){
        self.onLoginComplete?()
    }
    

}
