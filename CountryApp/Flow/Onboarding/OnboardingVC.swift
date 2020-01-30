//
//  OnboardingVC.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol OnboardingProtocol {
    var onTourComplete : (()->Void)? {get set}
    var onTourSkip : (()->Void)? {get set}
}

class OnboardingVC: UIViewController , OnboardingProtocol {
    // MARK: Onboarding Protocol
    var onTourComplete: (() -> Void)?
    
    var onTourSkip: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction private func onSkipButtonTap(_ sender : AnyObject){
        self.onTourSkip?()
    }
    
    @IBAction private func onFinishButtonTap(_ sender : AnyObject){
        self.onTourComplete?()
    }
    
}
