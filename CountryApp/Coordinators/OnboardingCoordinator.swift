//
//  OnboardingCoordinator.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

class OnboardingCoordinator : BaseCoordinator , CoordinatorFinishOutput {
    var finishFlow: (() -> Void)?
    
    let factory : Factory
    let routerProtocol : RouterProtocol
    
    init(routerProtocol : RouterProtocol , factory : Factory) {
        self.factory = factory
        self.routerProtocol = routerProtocol
    }
    
    override func start() {
        let vc = self.factory.instantiateOnboardingVC()
        vc.onTourComplete = {[unowned self] in
            self.routerProtocol.dismissModule(animated: true, completion: nil)
            self.finishFlow?()
        }
        vc.onTourSkip = {[unowned self] in
            self.routerProtocol.dismissModule(animated: true, completion: nil)
            self.finishFlow?()
        }
        routerProtocol.setRootModule(vc, hideBar: true)
    }
    
}
