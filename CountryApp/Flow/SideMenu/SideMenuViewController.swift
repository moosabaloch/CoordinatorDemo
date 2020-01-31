//
//  SideMenuViewController.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol DashboardControllerProtocol {
    var onSettingsTap : Closure? {set get}
    var onOpenSearchController : ClosureData<String>? {get set}
}

class SideMenuViewController: UIViewController , DashboardControllerProtocol  {
    
    var onSettingsTap : Closure?
    var onOpenSearchController : ClosureData<String>?
    var viewModel : SideMenuViewModel?
    
    @IBOutlet private weak var textFeild : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func onSettingsTapButton(_ sender : AnyObject){
        self.onSettingsTap?()
    }
    
    @IBAction private func onGoToSearchButton(_ sender : AnyObject){
        let count = (textFeild.text?.count ?? 0)
        if count > 5 {
            self.onOpenSearchController?(textFeild.text ?? "")
        }else {
            self.onOpenSearchController?(nil)
        }
    }
    
}
