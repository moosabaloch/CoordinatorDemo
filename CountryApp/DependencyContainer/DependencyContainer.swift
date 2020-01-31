//
//  DependencyContainer.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

typealias Factory = CoordinatorFactoryProtocol & ViewControllerFactory // Coordinator Factory and ViewController Factory
typealias ViewControllerFactory
    =
    SideMenuViewControllerFactory // Dashboard Flow - All View controllers in SideMenu
    & AuthViewControllerFactory // Auth Flow - All Login and Create account
    & OnboardingControllerFactory // Onboarding Flow - All Onboarding VC's
    & SettingsControllerFactory // Settings Flow - All Settings VC's
    & SearchViewControllerFactory // Search Flow - 

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
    func instantiateSearchCoordinator<T>(routerProtocol: RouterProtocol, data: CoordinatorData<T>) -> SearchCoordinator<T> {
        return SearchCoordinator<T>(routerProtocol: routerProtocol, factory: self, data: data)
    }
    
    
    func instantiateAuthCoordinator(routerProtocol: RouterProtocol) -> AuthCoordinator {
        return AuthCoordinator(routerProtocol: routerProtocol, factory: self)
    }
    
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
    func instantiateOnboardingCoordinator(routerProtocol: RouterProtocol) -> OnboardingCoordinator {
        return OnboardingCoordinator(routerProtocol: routerProtocol, factory: self)
    }
    
    func instantiateSettingsCoordinator(routerProtocol: RouterProtocol) -> SettingsCoordinator {
        return SettingsCoordinator(routerProtocol: routerProtocol, factory: self)
    }
}

// MARK: ViewControllers Factory Stub

// MARK: Dashboard Flow Factory implementation
extension DependencyContainer : SideMenuViewControllerFactory {
    func instantiateSideMenuViewController() -> SideMenuViewController {
        let sideMenuViewController = SideMenuViewController.instantiate(storyboard: UIStoryboard.sideMenu)
        sideMenuViewController.viewModel = SideMenuViewModel() // Can pass service DI
        return sideMenuViewController
    }
}

extension DependencyContainer : SearchViewControllerFactory {
    func instantiateSearchViewController() -> SearchViewController {
        return SearchViewController.instantiate(storyboard: UIStoryboard.search)
    }
}

// MARK: Onboarding Flow Factory implementation
extension DependencyContainer : OnboardingControllerFactory {
    func instantiateOnboardingVC() -> OnboardingVC {
        return OnboardingVC.instantiate(storyboard: UIStoryboard.onboarding)
    }
}

// MARK: Settings Flow Factory implementation
extension DependencyContainer : SettingsControllerFactory {
    
    func instantiateSettingsVC() -> SettingsVC {
        return SettingsVC.instantiate(storyboard: UIStoryboard.settings)
    }
}

// MARK: Authentication Flow Factory implementation
extension DependencyContainer : AuthViewControllerFactory {
    
    func instantiateChooseLoginRegisterViewController() -> ChooseLoginOrRegisterVC {
        return ChooseLoginOrRegisterVC.instantiate(storyboard: UIStoryboard.auth)
    }
    
    func instantiateLoginViewController() -> LoginVC {
        return LoginVC.instantiate(storyboard: .auth)
    }
    
    func instantiateRegisterViewController() -> RegisterVC {
        return RegisterVC.instantiate(storyboard: UIStoryboard.auth)
    }
}
