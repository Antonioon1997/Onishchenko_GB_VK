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
    @IBOutlet var holderView: UIView!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var firstAnimatebleBall: UIView!
    @IBOutlet var secondAnimatebleBall: UIView!
    @IBOutlet var thirdAnimatebleBall: UIView!
    @IBOutlet var viewForDots: UIView!
    
    var login = ""
    var password = ""
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - Style
        self.background.backgroundColor = UIColor(red: 0/255, green: 14/255, blue: 36/255, alpha: 1)
        self.pugBackground.backgroundColor = UIColor(red: 256.0/256.0, green: 256.0/256.0, blue:256.0/256.0, alpha: 0.3)
        self.loginTextField.backgroundColor = UIColor(red: 256.0/256.0, green: 256.0/256.0, blue: 256.0/256.0, alpha: 0.8)
        self.passwordTextField.backgroundColor = UIColor(red: 256.0/256.0, green: 256.0/256.0, blue: 256.0/256.0, alpha: 0.8)
        self.loginButton.layer.cornerRadius = 5
        self.holderView.backgroundColor = .clear
        self.viewForDots.isHidden = true
        //MARK: - Propertyes
        self.passwordTextField.clearsOnBeginEditing = true
        self.passwordTextField.isSecureTextEntry = true
        self.loginButton.showsTouchWhenHighlighted = true
        //MARK: - Hide KB
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    //MARK: - Nitifications for KB
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        firstAnimatebleBall.layer.cornerRadius = firstAnimatebleBall.frame.width/2
        secondAnimatebleBall.layer.cornerRadius = secondAnimatebleBall.frame.width/2
        thirdAnimatebleBall.layer.cornerRadius = thirdAnimatebleBall.frame.width/2
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //MARK: - Remove notifications from KB
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        

    }
    //MARK: - Start edition of func for scrollView and KB
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
    
    //MARK: - Authorization
    @IBAction func loginButtonAction(_ sender: UIButton) {
        viewForDots.isHidden = false
       
        jumpingDotsAnimation(firstAnimatebleBall, delay: 0, duration: 0.75)
        jumpingDotsAnimation(secondAnimatebleBall, delay: 0.5, duration: 0.75)
        jumpingDotsAnimation(thirdAnimatebleBall, delay: 1, duration: 0.75)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) { [self] in
            
            if loginTextField.text == login && passwordTextField.text == password {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainStoryboard = storyboard.instantiateViewController(identifier: "LoginScreen")
                
                mainStoryboard.transitioningDelegate = self
                
                present(mainStoryboard, animated: true)
//                self.performSegue(withIdentifier: "FromLoginScreen", sender: self)
//            } else {
//                let alert = UIAlertController(title: "Error", message: "Wrong login or password", preferredStyle: .actionSheet)
//                let alertButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
//                alert.addAction(alertButton)
//                present(alert, animated: true, completion: nil)
//            }
            }
        }
        
        
    }
    
    //MARK: - Animations
    
    func jumpingDotsAnimation(_ animatedView: UIView, delay: Double, duration: Double) {
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut, .repeat, .autoreverse,]) { [self] in
            animatedView.alpha = 0.1
        } completion: {_ in }
    }

    

}

extension ViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FlippingScreenAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FlippingScreenAnimation()
    }
}
