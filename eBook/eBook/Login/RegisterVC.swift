//
//  RegisterVC.swift
//  eBook
//
//  Created by Fno Khalid on 01/06/1443 AH.
//

import UIKit
import SafariServices
import FirebaseAuth
import Firebase
import AVFoundation
import FirebaseFirestore

class RegisterVC: UIViewController {
    
    
// MARK: Creating (UILabels / UITextFields / UIButtons) Programmatically For our CreateAccountViewController
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Register"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let fullNameTf: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Full Name",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        tf.borderStyle = .none
        tf.backgroundColor = #colorLiteral(red: 0.9802859426, green: 0.9804533124, blue: 0.9802753329, alpha: 1)
        tf.setLeftPaddingPoints(20)
        tf.textAlignment = .center
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailTF: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        tf.borderStyle = .none
        tf.backgroundColor = #colorLiteral(red: 0.9802859426, green: 0.9804533124, blue: 0.9802753329, alpha: 1)
        tf.setLeftPaddingPoints(20)
        tf.textAlignment = .center
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
//    let phoneTf: UITextField = {
//        let tf = UITextField()
//        tf.attributedPlaceholder = NSAttributedString(string: "Phone Number",
//                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
//        tf.borderStyle = .none
//        tf.backgroundColor = #colorLiteral(red: 0.9802859426, green: 0.9804533124, blue: 0.9802753329, alpha: 1)
//        tf.setLeftPaddingPoints(20)
//        tf.textAlignment = .center
//        tf.layer.cornerRadius = 5
//        tf.clipsToBounds = true
//        tf.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        tf.layer.borderWidth = 1
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        return tf
//    }()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        tf.borderStyle = .none
        tf.backgroundColor = #colorLiteral(red: 0.9802859426, green: 0.9804533124, blue: 0.9802753329, alpha: 1)
        tf.setLeftPaddingPoints(20)
        tf.textAlignment = .center
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
        
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.03392242268, green: 0.4783753157, blue: 0.9995169044, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        return button
    }()
    
    lazy var SignInLabel: UILabel = {
        let label = UILabel()
        label.text = "Already a Member? Sign In"
        label.textColor = #colorLiteral(red: 0.03392242268, green: 0.4783753157, blue: 0.9995169044, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        let labelTapped = UITapGestureRecognizer(target: self, action: #selector(signInAction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelTapped)
        return label
    }()
    
    let twitterButton: UIButton = {
       let tb = UIButton()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.setImage(UIImage.init(named: "twitter"), for: .normal)
        tb.addTarget(self, action: #selector(twitterButtonAction), for: .touchUpInside)
        tb.imageView?.contentMode = .scaleAspectFill
        tb.clipsToBounds = true
        return tb
    }()
    
    let instagramButton: UIButton = {
       let ib = UIButton()
        ib.translatesAutoresizingMaskIntoConstraints = false
        ib.setImage(UIImage.init(named: "instagram"), for: .normal)
        ib.addTarget(self, action: #selector(instagramButtonAction), for: .touchUpInside)
        return ib
    }()
    
    let githubButton: UIButton = {
       let gb = UIButton()
        gb.translatesAutoresizingMaskIntoConstraints = false
        gb.setImage(UIImage.init(named: "github"), for: .normal)
        gb.addTarget(self, action: #selector(githubButtonAction), for: .touchUpInside)
        return gb
    }()
    
    
//MARK: viewDidLoad Function
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.hideKeyboardWhenTappedAround()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "sixthbackground")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        setupView()
        setupConstraints()
    }
    
    @objc func signUpAction() {
        if let email = emailTF.text, email.isEmpty == false,
              let password = passwordTF.text, password.isEmpty == false {
              Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error == nil {
                  // go to main vc
                  let vc = UINavigationController(rootViewController: HomeVC())
                  vc.modalTransitionStyle = .crossDissolve
                  vc.modalPresentationStyle = .fullScreen
                  self.present(vc, animated: true, completion: nil)
                } else {
                    print(error?.localizedDescription )
                    let alert = UIAlertController(title: "Error", message: "Wrong information", preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)
                    alert.addAction(
                     UIAlertAction(title: NSLocalizedString("cancel", comment: ""),
                        style: UIAlertAction.Style.default,
                              handler: { Action in print("...")
                          })
                      )
                            return
                }
                guard let currentUserID = Auth.auth().currentUser?.uid else {return}
                Firestore.firestore().document("users/\(currentUserID)").setData([
                  "id" : currentUserID,
                  "name" : self.fullNameTf.text as Any,
                  "email" : self.emailTF.text as Any,
                  "password" : self.passwordTF.text as Any
                ])
              }
        }
    }
    
    @objc func signInAction() {
        print("Sign In Button Clicked")
        let loginViewController = LoginVC()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    
//MARK: Twitter/Instagram/GitHub Links
    
    
    @objc func twitterButtonAction() {
        print("Twitter Button Clicked")
        showSafariVC(for: "https://twitter.com/Corrrky")
    }
    
    @objc func instagramButtonAction() {
        print("Instagram Button Clicked")
        showSafariVC(for: "https://www.instagram.com/aidinahmadian/")
    }
    
    @objc func githubButtonAction() {
        print("GitHub Button Clicked")
        showSafariVC(for: "https://github.com/aidinahmadian")
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
               fullNameTf.resignFirstResponder()
               emailTF.resignFirstResponder()
               passwordTF.resignFirstResponder()
    
                      return true
              }
    
    
//MARK: SetupViews Function
        
    
    func setupView() {
        view.backgroundColor = UIColor(named: "Color")
        view.addSubview(titleLabel)
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(fullNameTf)
     //   view.addSubview(phoneTf)
        view.addSubview(signUpButton)
        view.addSubview(SignInLabel)
        view.addSubview(twitterButton)
        view.addSubview(instagramButton)
        view.addSubview(githubButton)
    }
    
    
// MARK: Setup Constraints Programmatically Using NSLayoutConstraint
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            
            fullNameTf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullNameTf.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            fullNameTf.heightAnchor.constraint(equalToConstant: 50),
            fullNameTf.widthAnchor.constraint(equalToConstant: 350),
            
            emailTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
            emailTF.heightAnchor.constraint(equalToConstant: 50),
            emailTF.widthAnchor.constraint(equalToConstant: 350),
            
            passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            passwordTF.widthAnchor.constraint(equalToConstant: 350),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            signUpButton.heightAnchor.constraint(equalToConstant: 100),
            signUpButton.widthAnchor.constraint(equalToConstant: 320)
        ])
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":titleLabel]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-70-[v0(45)]-65-[v1(44)]-20-[v3(44)]-20-[v5(44)]-20-[v7(44)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":titleLabel,"v1" : fullNameTf,"v3":emailTF,"v7":passwordTF]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":emailTF]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":passwordTF]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":fullNameTf]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":phoneTf]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[v0]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":signUpButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(30)]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":instagramButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(30)]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":githubButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-120-[v0(30)]-20-[v1(30)]-20-[v2(30)]-120-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":twitterButton, "v1":instagramButton, "v2":githubButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(55)]-25-[v1(35)]-25-[v2(30)]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": signUpButton,"v1":SignInLabel, "v2":twitterButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":SignInLabel]))
    }
}



// MARK: (LoginViewController/CreateAccountViewController) UITextField Left Padding Extension

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

// MARK: Hidding Software Keyboard

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
