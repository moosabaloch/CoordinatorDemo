//
//  BaseViewControllerProtocol.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import Foundation

protocol BaseViewControllerProtocol: NSObjectProtocol {
    var onNavigationBackButtonTap : Closure? {get set}
    var onBack : Closure?  {get set}
}
