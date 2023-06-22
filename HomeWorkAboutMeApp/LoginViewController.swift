//
//  ViewController.swift
//  HomeWorkAboutMeApp
//
//  Created by Акира on 06.06.2023.
//

import UIKit



class LoginViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet var textFieldUserLogin: UITextField!
    @IBOutlet var textFieldUserPassword: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let welcomeVC =
                segue.destination as? WelcomeViewController else { return } // здесь проверяем, что экран на который мы переходим ис WelcomeViewController
        welcomeVC.userName = textFieldUserLogin.text ?? "" // lелаем лейбл, а не текстфилд
        return
    }
    
    // MARK: IBActions
    @IBAction func userLoginWillBeTapped() {
        let userCheckLogin = textFieldUserLogin.text
        let userCheckPassword = textFieldUserPassword.text
        
        if userCheckLogin == UserFirst.userName && userCheckPassword == UserFirst.userPassword {
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        } else {
            presentAlert(withTitle: "Sorry", message: "Your login or password is wrong")
        }
    }
    
    @IBAction func userForgotLoginWillBeTapped() {
        presentAlert(withTitle: "C'mon!", message: "Your user name is *User*")
    }
    
    @IBAction func userForgotPasswordWillBeTapped() {
        presentAlert(withTitle: "C'mon!", message: "Your password is *123321*")
    }
    
    
}

// MARK: Extension

extension LoginViewController {
    
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textFieldUserPassword.text = ""
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
