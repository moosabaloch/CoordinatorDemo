//
//  BaseCoordinator.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import Foundation
typealias Closure = (()->Void)
typealias ClosureData<T> = ((T?)->Void)

enum CoordinatorData<T> {
    case someData(T) , noData
}

class BaseCoordinator: NSObject , Coordinator {
    
    // MARK: - Vars & Lets
    
    var childCoordinators = [Coordinator]()
    
    // MARK: - Public methods
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
        //print("Child Coordinator Counts: \(childCoordinators.count)")
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    // MARK: - Coordinator
    
    func start() {
        start(with: nil)
    }
    
    func start(with option: DeepLinkOption?) {
        
    }
    
}
