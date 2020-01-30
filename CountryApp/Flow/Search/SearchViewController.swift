//
//  SearchViewController.swift
//  CountryApp
//
//  Created by Moosa Baloch on 30/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

protocol SearchViewControllerProtocol {
    var onBack : Closure?  {get set}
}

class SearchViewController: UIViewController , SearchViewControllerProtocol {
    var onBack: Closure?

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
