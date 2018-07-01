//
//  LoginViewController.swift
//  Native App
//
//  Created by Fernando Luna on 6/30/18.
//  Copyright © 2018 f3rn4nd0. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController, NVActivityIndicatorViewable {
    
    var presenter: LoginPresenter!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    static func instance() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showErrorMessage(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default , handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showInfoMessage(message: String) {
        let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default , handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUpInsideLogin(_ sender: UIButton) {
        guard let emailText = email.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return
        }
        guard let passwordText = password.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return
        }
        presenter.login(email: emailText, password: passwordText)
    }

}

