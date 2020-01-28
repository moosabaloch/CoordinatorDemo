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
}


//protocol AuthViewControllerFactory {
//    func instantiateChooseLoginRegisterViewController() -> ChooseLoginRegisterViewController
//    func instantiateLoginViewController() -> LoginViewController
//    func instantiateRegisterViewController() -> RegisterViewController
//}
//
protocol SideMenuViewControllerFactory {
    func instantiateSideMenuViewController() -> SideMenuViewController
}
