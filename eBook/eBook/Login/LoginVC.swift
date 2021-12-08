//
//  LoginVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit
import FirebaseAuth


class LoginVC: UIViewController, UITextFieldDelegate  {
    
    
    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        logo.layer.cornerRadius = 25
        logo.isUserInteractionEnabled = true
        
        return logo
    }()
    
    var emailTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemGray6
        tf.placeholder = ("   Enter Email ...")
        tf.layer.cornerRadius = .minimumMagnitude(20, 20)
        tf.isSecureTextEntry = false

        return tf
    }()
    
    var passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = .minimumMagnitude(20, 20)
        tf.placeholder = ("   Enter Password....")

        return tf
    }()
    
    var loginBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    var registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Register", for: .normal)
        btn.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        btn.addTarget(self, action: #selector(registerBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()

               return true
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.emailTF.delegate = self
        self.passwordTF.delegate = self
        
        setupGradientView()
        view.backgroundColor = UIColor(named: "Color")
        
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
        view.addSubview(logoImage)
        

        logoImage.tintColor = UIColor(ciColor: .black)
        logoImage.layer.masksToBounds = true
        logoImage.layer.cornerRadius = 100
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 300),
            logoImage.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
            emailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            emailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            emailTF.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 24),
            passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),
            
            loginBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 48),
            loginBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            loginBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            loginBtn.heightAnchor.constraint(equalToConstant: 40),
            
            
            registerBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 24),
            registerBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            registerBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            registerBtn.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupGradientView() {
        let _ = GradientView(self)
    }
    
    @objc func registerBtnPressed() {
        let email = emailTF.text!
        let password = passwordTF.text!
        
        if email.isEmpty || password.isEmpty {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error as Any)
                return
            }
            let newVC1 = TabVC()
            newVC1.navigationItem.largeTitleDisplayMode = .never
            self.navigationController?.pushViewController(newVC1, animated: true)
        }
        
        
    }
    @objc func loginBtnPressed() {
        let email = emailTF.text!
        let password = passwordTF.text!
        
        if email.isEmpty || password.isEmpty {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error as Any)
                return
            }
            
            let newVC2 = TabVC()
            newVC2.navigationItem.largeTitleDisplayMode = .never
            self.navigationController?.viewControllers = [newVC2]
        }
        
    }
}
