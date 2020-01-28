//
//  SideMenuCoordinator.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import Foundation

class SideMenuCoordinator : BaseCoordinator , CoordinatorFinishOutput {
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
        self.showSideMenuViewController()
    }
    
    private func showSideMenuViewController() {
        let vc = self.factory.instantiateSideMenuViewController()
        self.routerProtocol.setRootModule(vc, hideBar: true)
        
    }

    
}
