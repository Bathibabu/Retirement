//
//  ViewController.swift
//  Retirement
//
//  Created by Bathi on 23/02/22.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
    
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Oops", message: "Sorry about that, an error occured.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It's cool", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        print("Welcome")
        Analytics.trackEvent("navigated_to_calculator")
    }
    
    @IBAction func click(_ sender: Any) {
        
        let current_age : Int? = Int("25")
        let planned_retirement_age : Int? = Int("35")
        
        let properties = ["current_age": String(current_age!),
                          "planned_retirement_age": String(planned_retirement_age!)]
        
        Analytics.trackEvent("calculate_retirement_amount", withProperties: properties)    }
}

