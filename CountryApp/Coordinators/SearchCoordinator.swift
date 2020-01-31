//
//  SearchCoordinator.swift
//  CountryApp
//
//  Created by Moosa Baloch on 30/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit


class SearchCoordinator<T>: BaseCoordinator , CoordinatorFinishOutput {
    var finishFlow: (() -> Void)?
    
    private let router : RouterProtocol
    private let factory : Factory
    private let data : CoordinatorData<T>
    
    
    init(routerProtocol : RouterProtocol , factory : Factory , data : CoordinatorData<T>) {
        self.router = routerProtocol
        self.factory = factory
        self.data = data
    }
    
    override func start() {
        self.showSearchViewController()
    }
    
    
    private func showSearchViewController(){
        switch data {
        case .someData(let val as String):
            let vc = self.factory.instantiateSearchViewController()
            vc.predefineText = val
            vc.onBack = {[unowned self] in
                self.router.popModule()
                self.finishFlow?()
            }
            vc.onNavigationBackButtonTap = { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.finishFlow?()
            }
            self.router.push(vc)
            
            break
        default:
            let vc = self.factory.instantiateSearchViewController()
            vc.predefineText = "No Data"
            vc.onBack = {[unowned self] in
                self.router.popModule()
                self.finishFlow?()
            }
            vc.onNavigationBackButtonTap = { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.finishFlow?()
            }
            self.router.push(vc)
            break
        }
    }
    
}
