//
//  UIStoryboard.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static var sideMenu : UIStoryboard {
        return UIStoryboard.init(name: "SideMenu", bundle: Bundle.main)
    }
    static var auth : UIStoryboard {
        return UIStoryboard.init(name: "AuthStoryboard", bundle: Bundle.main)
    }
}
