//
//  LaunchInstructor.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import Foundation

enum LaunchInstructor {
    
    case main
    case auth
    case onboarding
    
    // MARK: - Public methods
    
    static func configure(isAutorized: Bool = false, tutorialWasShown: Bool = false) -> LaunchInstructor {
        
        let isAutorized = isAutorized
        let tutorialWasShown = tutorialWasShown
        
//        if AuthUserDefaultsServices.shared().getToken() != nil {
//            isAutorized = true
//            tutorialWasShown = true
//        }
        
        switch (tutorialWasShown, isAutorized) {
            case (true, false), (false, false): return .auth
            case (false, true): return .onboarding
            case (true, true): return .main
        }
    }
}
