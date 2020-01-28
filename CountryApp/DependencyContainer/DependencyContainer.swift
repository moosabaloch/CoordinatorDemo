//
//  DependencyContainer.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

typealias Factory = CoordinatorFactoryProtocol & ViewControllerFactory
typealias ViewControllerFactory = SideMenuViewControllerFactory
class DependencyContainer {
    
    // MARK: - Initialization
      init(rootController: UINavigationController) {
          self.rootController = rootController
      }
    
    // MARK: - Vars & Lets
    private var rootController: UINavigationController
    
    // MARK: App Coordinator
    internal lazy var aplicationCoordinator = self.instantiateApplicationCoordinator()
    
    // MARK: APi Manager
    
//    internal lazy var sessionManager = SessionManager()
    
    // MARK: Cache services
//    internal lazy var userServices = UserServices()
    
    // MARK: - Public func
    
    func start() {
        self.aplicationCoordinator.start()
    }
}

// MARK: Coordinators Factory Stub
extension DependencyContainer : CoordinatorFactoryProtocol {
    func instantiateSideMenuCoordinator(routerProtocol router: RouterProtocol) -> SideMenuCoordinator {
        return SideMenuCoordinator(routerProtocol: router, factory: self)
    }
    
    func instantiateApplicationCoordinator() -> AppCoordinator {
        return AppCoordinator(
            router:Router(rootController: rootController),
            factory: self as Factory,
            launchInstructor: LaunchInstructor.configure()
        )
    }
}

// MARK: ViewControllers Factory Stub
extension DependencyContainer : SideMenuViewControllerFactory {
    func instantiateSideMenuViewController() -> SideMenuViewController {
         let sideMenuViewController = UIStoryboard
            .sideMenu
            .instantiateViewController(
                withIdentifier: "SideMenuViewController") as! SideMenuViewController
        
        sideMenuViewController.viewModel = SideMenuViewModel() // Can pass service DI
        return sideMenuViewController
    }
    
    
}
