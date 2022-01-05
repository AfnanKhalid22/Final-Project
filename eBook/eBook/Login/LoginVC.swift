//
//  LoginVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase
import AVFoundation
import TransitionButton
import FirebaseFirestore
import SafariServices

class LoginVC: UIViewController {
    

// MARK: Creating (UILabels / UITextFields / UIButtons) Programmatically For our LoginViewController
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let mailTf: UITextField = {
       let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
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
    
    let passwordTf: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
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
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.03392242268, green: 0.4783753157, blue: 0.9995169044, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 10.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return button
    }()
    
     lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account? Register Now"
        label.textColor = #colorLiteral(red: 0.03392242268, green: 0.4783753157, blue: 0.9995169044, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        let labelTapped = UITapGestureRecognizer(target: self, action: #selector(signUpAction))
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
    
        let forgetPassButton : TransitionButton = {
            let btn = TransitionButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.setTitle("Forget Password?", for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    //        btn.tintColor = UIColor(named: "textColor")
            btn.setTitleColor(UIColor(named: "textColor"), for: .normal)
            btn.addTarget(self, action: #selector(forgetPassword), for: .touchUpInside)
          return btn
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

    
    @objc func signInAction() {
        if let email = mailTf.text, email.isEmpty == false,
                         let password = passwordTf.text, password.isEmpty == false {
                         Auth.auth().signIn(withEmail: email, password: password) { result, error in
                           if error == nil {
                             // go to main vc
                             let vc = UINavigationController(rootViewController: TabVC())
                             vc.modalTransitionStyle = .crossDissolve
                             vc.modalPresentationStyle = .fullScreen
                             self.present(vc, animated: true, completion: nil)
                           } else {
                             print(error?.localizedDescription)
                               let alert = UIAlertController(title: "Error", message: "Wrong email or password", preferredStyle: .alert)
                               self.present(alert, animated: true, completion: nil)
                               alert.addAction(
                                UIAlertAction(title: NSLocalizedString("cancel", comment: ""),
                                   style: UIAlertAction.Style.default,
                                         handler: { Action in print("...")
                                     })
       
                                 )
                                   return
                           }
                         }
                         }
    }
    
    @objc func signUpAction() {
        print("Sign Up Button Clicked")
        let createAccountViewController = RegisterVC()
        navigationController?.pushViewController(createAccountViewController, animated: true)
    }
    
        @objc func forgetPassword() {
            let passwordVC = ForgetPassword()
            passwordVC.navigationItem.largeTitleDisplayMode = .never
            self.navigationController?.pushViewController(passwordVC,animated: true)
        }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
             
               mailTf.resignFirstResponder()
               passwordTf.resignFirstResponder()
    
                      return true
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
    
    
//MARK: SetupViews Function
    
        
    func setupView() {
        view.backgroundColor = UIColor.white
        view.addSubview(twitterButton)
        view.addSubview(instagramButton)
        view.addSubview(githubButton)
        view.addSubview(titleLabel)
        view.addSubview(mailTf)
        view.addSubview(passwordTf)
        view.addSubview(signInButton)
        view.addSubview(signUpLabel)
        view.addSubview(forgetPassButton)
    }
    
// MARK: Setup Constraints Programmatically Using NSLayoutConstraint
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            
            mailTf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mailTf.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            mailTf.heightAnchor.constraint(equalToConstant: 50),
            mailTf.widthAnchor.constraint(equalToConstant: 350),
            
            passwordTf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTf.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
            passwordTf.heightAnchor.constraint(equalToConstant: 50),
            passwordTf.widthAnchor.constraint(equalToConstant: 350),
            
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            signInButton.heightAnchor.constraint(equalToConstant: 100),
            signInButton.widthAnchor.constraint(equalToConstant: 320),
            
            forgetPassButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgetPassButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 420),
            
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 470),
        ])

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(55)]-25-[v2(35)]-25-[v3(30)]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : signInButton,"v2": signUpLabel, "v3":twitterButton]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":signUpLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(30)]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":instagramButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(30)]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":githubButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-120-[v0(30)]-20-[v1(30)]-20-[v2(30)]-120-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":twitterButton, "v1":instagramButton, "v2":githubButton]))
    }
}


//class LoginVC: UIViewController, UITextFieldDelegate {
//
//    lazy var logoImage: UIImageView = {
//        let logo = UIImageView()
//        logo.image = UIImage(named: "icon")
//        logo.translatesAutoresizingMaskIntoConstraints = false
//        logo.layer.cornerRadius = 25
//        logo.isUserInteractionEnabled = true
//
//        return logo
//    }()
//
//    lazy var appName: UILabel = {
//        let name = UILabel()
//         name.textAlignment = .center
//         name.textColor = UIColor(named: "textColor")
//         name.text = "eBook"
//         name.font = UIFont(name:"Hoefler Text Italic", size: 48.0)
//         name.textAlignment = NSTextAlignment.right
//         name.numberOfLines = 1
//         name.translatesAutoresizingMaskIntoConstraints = false
//        return name
//    }()
//
//    let segmentedControl = UISegmentedControl()
//
//    lazy var nameTF: UITextField = {
//     let name = UITextField()
//       name.placeholder = NSLocalizedString("write", comment: "")
//       name.textAlignment = .center
//       name.keyboardType = .alphabet
//       name.translatesAutoresizingMaskIntoConstraints = false
//       name.textColor = UIColor(named: "textColor")
//       name.font = UIFont.systemFont(ofSize: 14)
//       name.backgroundColor = .lightGray
//       name.layer.cornerRadius = 8
//
//        return name
//    }()
//
//
//    var emailTF: UITextField = {
//        let tf = UITextField()
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.backgroundColor = .lightGray
//        tf.textAlignment = .center
//        tf.keyboardType = .emailAddress
//        tf.layer.cornerRadius = 8
//        tf.font = UIFont.systemFont(ofSize: 14)
//        tf.textColor = UIColor(named: "textColor")
//        tf.attributedPlaceholder = NSAttributedString(
//            string: NSLocalizedString("email", comment: ""),
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//        tf.isSecureTextEntry = false
//
//        return tf
//    }()
//
//    var passwordTF: UITextField = {
//        let tf = UITextField()
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.isSecureTextEntry = true
//        tf.textAlignment = .center
//        tf.backgroundColor = .lightGray
//        tf.font = UIFont.systemFont(ofSize: 14)
//        tf.textColor = UIColor(named: "textColor")
//        tf.layer.cornerRadius = 8
//        tf.attributedPlaceholder = NSAttributedString(
//            string: NSLocalizedString("password", comment: ""),
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//
//        return tf
//    }()
//
//    lazy var confTF:  UITextField = {
//          let conf = UITextField()
//         conf.placeholder = NSLocalizedString("conf", comment: "")
//         conf.textAlignment = .center
//         conf.translatesAutoresizingMaskIntoConstraints = false
//         conf.textColor = UIColor(named: "textColor")
//         conf.font = UIFont.systemFont(ofSize: 14)
//         conf.backgroundColor = .lightGray
//         conf.layer.cornerRadius = 8
//         conf.isSecureTextEntry = true
//        return conf
//
//      }()
//
//    let logInButton : TransitionButton = {
//        let btn = TransitionButton()
//        btn.setTitle("LogIn", for: .normal)
//        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
//        btn.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
//        btn.layer.cornerRadius = 15
//        btn.tintColor = .white
//        btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
//      return btn
//    }()
//
//    let signUp : TransitionButton = {
//        let btn = TransitionButton()
//        btn.setTitle("Sign Up", for: .normal)
//        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
//        btn.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
//        btn.layer.cornerRadius = 15
//        btn.tintColor = .white
//        btn.addTarget(self, action: #selector(registerBtnPressed), for: .touchUpInside)
//      return btn
//    }()
//
//    let forgetPassButton : TransitionButton = {
//        let btn = TransitionButton()
//        btn.setTitle("Forget Password?", for: .normal)
//        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
////        btn.tintColor = UIColor(named: "textColor")
//        btn.setTitleColor(UIColor(named: "textColor"), for: .normal)
//        btn.addTarget(self, action: #selector(forgetPassword), for: .touchUpInside)
//      return btn
//    }()
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//      setupUI()
//      self.nameTF.delegate = self
//      self.emailTF.delegate = self
//      self.passwordTF.delegate = self
//      self.confTF.delegate = self
//
//  }
//
//    @objc func forgetPassword() {
//        let passwordVC = ForgetPassword()
//        passwordVC.navigationItem.largeTitleDisplayMode = .never
//        self.navigationController?.pushViewController(passwordVC,animated: true)
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//           nameTF.resignFirstResponder()
//           emailTF.resignFirstResponder()
//           passwordTF.resignFirstResponder()
//           confTF.resignFirstResponder()
//
//                  return true
//          }
//
//  let stackView : UIStackView = {
//    $0.translatesAutoresizingMaskIntoConstraints = false
//    $0.axis = .vertical
//    $0.distribution = .fillEqually
//    $0.spacing = 15
//
//       return $0
//
//  }(UIStackView())
//
//        @objc func loginBtnPressed() {
//            if let email = emailTF.text, email.isEmpty == false,
//                  let password = passwordTF.text, password.isEmpty == false {
//                  Auth.auth().signIn(withEmail: email, password: password) { result, error in
//                    if error == nil {
//                      // go to main vc
//                      let vc = UINavigationController(rootViewController: TabVC())
//                      vc.modalTransitionStyle = .crossDissolve
//                      vc.modalPresentationStyle = .fullScreen
//                      self.present(vc, animated: true, completion: nil)
//                    } else {
//                      print(error?.localizedDescription)
//                        let alert = UIAlertController(title: "Error", message: "Wrong email or password", preferredStyle: .alert)
//                        self.present(alert, animated: true, completion: nil)
//                        alert.addAction(
//                         UIAlertAction(title: NSLocalizedString("cancel", comment: ""),
//                            style: UIAlertAction.Style.default,
//                                  handler: { Action in print("...")
//                              })
//
//                          )
//                            return
//                    }
//                  }
//
//                self.logInButton.startAnimation()
//                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//                self.logInButton.stopAnimation(animationStyle: .expand, revertAfterDelay: 0 ) {
//                DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
//
//                let newVC2 = TabVC()
//                newVC2.modalPresentationStyle = .fullScreen
//                self.present(newVC2, animated: true, completion: nil)
//
//                            }
//
//                        }
//                    }
//            }
//        }
//
//        @objc func registerBtnPressed() {
//            if let email = emailTF.text, email.isEmpty == false,
//                  let password = passwordTF.text, password.isEmpty == false {
//                  Auth.auth().createUser(withEmail: email, password: password) { result, error in
//                    if error == nil {
//                      // go to main vc
//                      let vc = UINavigationController(rootViewController: HomeVC())
//                      vc.modalTransitionStyle = .crossDissolve
//                      vc.modalPresentationStyle = .fullScreen
//                      self.present(vc, animated: true, completion: nil)
//                    } else {
//                        print(error?.localizedDescription )
//                        let alert = UIAlertController(title: "Error", message: "Wrong information", preferredStyle: .alert)
//                        self.present(alert, animated: true, completion: nil)
//                        alert.addAction(
//                         UIAlertAction(title: NSLocalizedString("cancel", comment: ""),
//                            style: UIAlertAction.Style.default,
//                                  handler: { Action in print("...")
//                              })
//                          )
//                                return
//                    }
//                    guard let currentUserID = Auth.auth().currentUser?.uid else {return}
//                    Firestore.firestore().document("users/\(currentUserID)").setData([
//                      "id" : currentUserID,
//                      "name" : self.nameTF.text as Any,
//                      "email" : self.emailTF.text as Any,
//                      "password" : self.passwordTF.text as Any
//                    ])
//                  }
//
//                self.signUp.startAnimation()
//                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//                self.signUp.stopAnimation(animationStyle: .expand, revertAfterDelay: 0 ) {
//                DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
//
//                let newVC2 = TabVC()
//                newVC2.modalPresentationStyle = .fullScreen
//                self.present(newVC2, animated: true, completion: nil)
//                            }
//
//                        }
//                    }
//                }
//  }
//
//    func setupUI() {
//
//      view.backgroundColor = UIColor(named: "Color")
//      view.addSubview(stackView)
//         setupGradientView()
//         stackView.addArrangedSubview(segmentedControl)
//         stackView.addArrangedSubview(nameTF)
//         stackView.addArrangedSubview(emailTF)
//         stackView.addArrangedSubview(passwordTF)
//         stackView.addArrangedSubview(confTF)
//         stackView.addArrangedSubview(logInButton)
//         stackView.addArrangedSubview(signUp)
//         stackView.addArrangedSubview(forgetPassButton)
//
//         segmentedControl.insertSegment(withTitle: "Rigester", at: 0, animated: true)
//         segmentedControl.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
//
//         segmentedControl.setTitle("Rigester", forSegmentAt: 0)
//         segmentedControl.insertSegment(withTitle: "Login", at: 1, animated: true)
//         segmentedControl.setTitle("Login", forSegmentAt: 1)
//         segmentedControl.addTarget(self, action: #selector(Segment), for: .valueChanged)
//             NSLayoutConstraint.activate([
//          stackView.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 350),
//          stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//          stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//          stackView.heightAnchor.constraint(equalToConstant: 300)
//  ])
//}
//
//  func setupLogoImage() {
//      view.addSubview(logoImage)
//    logoImage.tintColor = UIColor(ciColor: .black)
//    logoImage.layer.masksToBounds = true
//    logoImage.layer.cornerRadius = 100
//    logoImage.contentMode = .scaleAspectFit
//    logoImage.translatesAutoresizingMaskIntoConstraints = false
//
//      NSLayoutConstraint.activate([
//          logoImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 90),
//          logoImage.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 70),
//          stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//          stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//          logoImage.heightAnchor.constraint(equalToConstant: 250),
//          logoImage.widthAnchor.constraint(equalToConstant: 250),
//      ])
//
//      view.addSubview(appName)
//      NSLayoutConstraint.activate([
//          appName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          appName.topAnchor.constraint(equalTo: view.topAnchor, constant: 365),
//
//      ])
//  }
//
//@objc func Segment(_ sender: Any) {
//    switch segmentedControl.selectedSegmentIndex {
//    case 0:
//        self.nameTF.isHidden = false
//      confTF.isHidden = false
//      signUp.isHidden = false
//      logInButton.isHidden = true
//      forgetPassButton.isHidden = true
//    case 1:
//        self.nameTF.isHidden = true
//      confTF.isHidden = true
//      signUp.isHidden = true
//      logInButton.isHidden = false
//      forgetPassButton.isHidden = false
//    default:
//       break;
//    }
//  }
//       private func setupGradientView() {
//           setupLogoImage()
//          let _ = GradientView(self)
//      }
//}
