//
//  OnboardingVC.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol OnboardingProtocol : BaseViewControllerProtocol {
    var onTourComplete :  Closure? {get set}
    var onTourSkip : Closure? {get set}
}

class OnboardingVC: UIViewController , OnboardingProtocol {
    
    // MARK: Onboarding Protocol
    var onTourComplete: Closure?
    var onTourSkip: Closure?
    var onNavigationBackButtonTap: Closure?    
    var onBack: Closure?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func onSkipButtonTap(_ sender : AnyObject){
        self.onTourSkip?()
    }
    
    @IBAction private func onFinishButtonTap(_ sender : AnyObject){
        self.onTourComplete?()
    }
}
