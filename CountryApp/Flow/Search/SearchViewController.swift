//
//  SearchViewController.swift
//  CountryApp
//
//  Created by Moosa Baloch on 30/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController , BaseViewControllerProtocol {
    // MARK: BaseViewController closures.
    var onNavigationBackButtonTap: Closure?
    var onBack: Closure?

    // MARK: Variables
    @IBOutlet private weak var labelView: UILabel!
    var predefineText : String = "No Text"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.labelView.text = predefineText
        
    }
    
    @IBAction private func onBackTap(_ sender : AnyObject) {
        self.onBack?()
    }

}
