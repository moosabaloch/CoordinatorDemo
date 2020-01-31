//
//  AppCoordinator.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator  {
    
    private let factory : Factory
    private let routerProtocol : RouterProtocol
    private var launchInstructor : LaunchInstructor
    
    init(router: RouterProtocol , factory : Factory , launchInstructor : LaunchInstructor) {
        self.routerProtocol = router
        self.factory = factory
        self.launchInstructor = launchInstructor
    }
    
    override func start(with option: DeepLinkOption?) {
        if let _ = option {
            
        }else{
            switch launchInstructor { // Based on User session go to relevant flow
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            case .onboarding: runOnboarding()
            }
        }
    }
    
    func runOnboarding()  {
        let coordinator = self.factory.instantiateOnboardingCoordinator(routerProtocol: routerProtocol)
        coordinator.finishFlow = {[unowned self , unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure(isAutorized: true, tutorialWasShown: true)
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    func runAuthFlow() {
        let coordinator = self.factory.instantiateAuthCoordinator(routerProtocol: routerProtocol)
        coordinator.finishFlow = { [unowned self , unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure(isAutorized: true, tutorialWasShown: false)
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    func runMainFlow()  {
        let coordinator = self.factory.instantiateSideMenuCoordinator(routerProtocol: routerProtocol)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure(isAutorized: false, tutorialWasShown: true)
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
}
