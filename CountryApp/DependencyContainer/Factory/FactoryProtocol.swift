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
}

protocol AuthViewControllerFactory {
    func instantiateChooseLoginRegisterViewController() -> ChooseLoginOrRegisterVC
    func instantiateLoginViewController() -> LoginVC
    func instantiateRegisterViewController() -> RegisterVC 
}


protocol SideMenuViewControllerFactory {
    func instantiateSideMenuViewController() -> SideMenuViewController
}
