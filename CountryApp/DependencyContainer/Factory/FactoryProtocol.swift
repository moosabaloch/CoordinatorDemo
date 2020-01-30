//
//  FactoryProtocol.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func instantiateApplicationCoordinator() -> AppCoordinator
    func instantiateSideMenuCoordinator(routerProtocol: RouterProtocol) -> SideMenuCoordinator
    func instantiateAuthCoordinator(routerProtocol: RouterProtocol) -> AuthCoordinator
    func instantiateOnboardingCoordinator(routerProtocol : RouterProtocol ) -> OnboardingCoordinator
    func instantiateSettingsCoordinator(routerProtocol : RouterProtocol ) -> SettingsCoordinator
    func instantiateSearchCoordinator<T>(routerProtocol : RouterProtocol , data : CoordinatorData<T>) -> SearchCoordinator<T>
}

protocol SettingsControllerFactory {
    func instantiateSettingsVC() -> SettingsVC
}

protocol OnboardingControllerFactory {
    func instantiateOnboardingVC() -> OnboardingVC
}

protocol AuthViewControllerFactory {
    func instantiateChooseLoginRegisterViewController() -> ChooseLoginOrRegisterVC
    func instantiateLoginViewController() -> LoginVC
    func instantiateRegisterViewController() -> RegisterVC 
}

protocol SideMenuViewControllerFactory {
    func instantiateSideMenuViewController() -> SideMenuViewController
}

protocol SearchViewControllerFactory {
    func instantiateSearchViewController() -> SearchViewController
}
