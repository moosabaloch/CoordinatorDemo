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
    var finishFlow: Closure?
    
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
        vc.onSettingsTap = { [unowned self] in
            self.startSettingsFlow()
        }
        vc.onOpenSearchController = {[unowned self] data in
            self.startSearchCoordinatorFlow(data: data)
        }
        self.routerProtocol.setRootModule(vc, hideBar: true)
    }
    
    private func startSearchCoordinatorFlow(data : String?){
        if let d = data {
            let searchCoord = self.factory.instantiateSearchCoordinator(routerProtocol: self.routerProtocol, data: CoordinatorData.someData(d))
            searchCoord.finishFlow = {[unowned self , unowned searchCoord] in
                self.routerProtocol.popModule()
                self.removeDependency(searchCoord)
            }
            self.addDependency(searchCoord)
            searchCoord.start()
        }else {
            let searchCoord = self.factory.instantiateSearchCoordinator(routerProtocol: self.routerProtocol, data: CoordinatorData<Any>.noData)
            searchCoord.finishFlow = {[unowned self , unowned searchCoord] in
                self.routerProtocol.popModule()
                self.removeDependency(searchCoord)
            }
            self.addDependency(searchCoord)
            searchCoord.start()
        }
    }
    
    
    
//SearchCoordinator
    private func startSettingsFlow(){
        let settingsCoordinator = self.factory.instantiateSettingsCoordinator(routerProtocol: routerProtocol)
        settingsCoordinator.finishFlow = {[unowned self , unowned settingsCoordinator] in
            self.removeDependency(settingsCoordinator)
        }
        settingsCoordinator.logout = {[unowned self , unowned settingsCoordinator] in
            self.removeDependency(settingsCoordinator)
            self.finishFlow?()
        }
        self.addDependency(settingsCoordinator)
        settingsCoordinator.start()
    }
    
}
