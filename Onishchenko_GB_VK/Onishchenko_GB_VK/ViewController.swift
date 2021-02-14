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
    @IBOutlet var scrollView: UIScrollView!
    var login = "Admin"
    var password = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.background.backgroundColor = UIColor(red: 240.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1)
        self.pugBackground.backgroundColor = UIColor(red: 210.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1)
        self.loginTextField.backgroundColor = UIColor(red: 210.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1)
        
            //MARK
        self.passwordTextField.clearsOnBeginEditing = true
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.backgroundColor = UIColor(red: 210.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1)
            //MARK
        self.loginButton.showsTouchWhenHighlighted = true
        self.loginButton.layer.cornerRadius = 5
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
               scrollView?.addGestureRecognizer(hideKeyboardGesture)

    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
           NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
           // Второе — когда она пропадает
           NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    @objc func keyboardShow (notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let sizeOfKB = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: sizeOfKB.height, right: 0.0)
        self.scrollView?.contentInset = contentInsets
                scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardHide(notification: Notification) {
            let contentInsets = UIEdgeInsets.zero
            scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        if loginTextField.text == login && passwordTextField.text == password {
            self.performSegue(withIdentifier: "FromLoginScreen", sender: self)
        } else {
            let alert = UIAlertController(title: "Error", message: "Wrong login or password", preferredStyle: .actionSheet)
            let alertButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(alertButton)
            present(alert, animated: true, completion: nil)
        }
    }
}

