//
//  ViewController.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 13.02.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var background: UIView!
    @IBOutlet var pugBackground: UIView!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.background.backgroundColor = UIColor(red: 240.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1)
        self.pugBackground.backgroundColor = UIColor(red: 210.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1)
        self.loginTextField.backgroundColor = UIColor(red: 210.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1)
        
        self.passwordTextField.clearsOnBeginEditing = true
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.backgroundColor = UIColor(red: 210.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1)
        
        self.loginButton.showsTouchWhenHighlighted = true
        self.loginButton.layer.cornerRadius = 5
    }


}

