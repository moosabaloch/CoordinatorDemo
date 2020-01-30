//
//  SettingsCoordinator.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol SettingsCoordinatorProtocol {
    var logout : Closure? {get set}
}

class SettingsCoordinator : BaseCoordinator , CoordinatorFinishOutput , SettingsCoordinatorProtocol{
   
    var logout: Closure?
    
    var finishFlow: Closure?
    
    
    let factory : Factory
    let routerProtocol : RouterProtocol
    
    init(routerProtocol : RouterProtocol , factory : Factory) {
        self.factory = factory
        self.routerProtocol = routerProtocol
    }
    
    override func start() {
        let vc = self.factory.instantiateSettingsVC()
        vc.onLogoutTap = {[unowned self] in
            self.logout?()
        }
        routerProtocol.push(vc)
    }
    
}
