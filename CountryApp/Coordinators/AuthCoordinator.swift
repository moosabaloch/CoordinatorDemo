//
//  AuthCoordinator.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import Foundation
class AuthCoordinator : BaseCoordinator , CoordinatorFinishOutput {
    // CoordinatorFinishOutput
    var finishFlow: (() -> Void)?
    
    // MARK: Vars and Lets
    
    private let factory: Factory
    private let routerProtocol : RouterProtocol
    
    init(routerProtocol : RouterProtocol , factory : Factory) {
        self.factory = factory
        self.routerProtocol = routerProtocol
    }
    
    override func start() {
        self.showLoginOrRegister()
    }
    
    private func showLoginOrRegister() {
        let vc = self.factory.instantiateChooseLoginRegisterViewController()
        vc.onLogin = { [unowned self] in
            self.showLoginScreen()
        }
        vc.onRegister = { [unowned self] in
            self.showRegisterScreen()
        }
        self.routerProtocol.setRootModule(vc, hideBar: true)
    }
    
    private func showLoginScreen(){
        let vc = self.factory.instantiateLoginViewController()
        vc.onBack = { [unowned self] in
            self.routerProtocol.popModule()
        }
        vc.onLoginComplete = { [unowned self] in
            self.finishFlow?()
        }
        self.routerProtocol.push(vc)
    }
    
    private func showRegisterScreen(){
        let vc = self.factory.instantiateRegisterViewController()
        vc.onBack = { [unowned self] in
            self.routerProtocol.popModule()
        }
        vc.onRegisterComplete = { [unowned self] in
            self.finishFlow?()
        }
        self.routerProtocol.push(vc)
    }
    
    
}
