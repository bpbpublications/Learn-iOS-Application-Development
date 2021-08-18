//
//  ViewController.swift
//  LocalizationDemo
//
//  Created by Trainer on 28/08/20.
//  Copyright © 2020 Trainer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameTextField.text = "View did load"
        
        if let language = Locale.current.languageCode{
            let imageName = "flag-\(language)"
            self.flagImage.image = UIImage(named: imageName)
            
            switch language {
            case "ru":
                countryLabel.text = "Россия"
            case "fr":
                countryLabel.text = "France"
            default:
                countryLabel.text = "USA"
            }
            
        }
        
        
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let title = NSLocalizedString("Welcome", comment: "")
        let message = NSLocalizedString("Welcome to my App.", comment: "")
        let okButton = NSLocalizedString("Ok", comment: "")
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: okButton, style: .cancel, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

