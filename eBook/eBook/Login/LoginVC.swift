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


class LoginVC: UIViewController, UITextFieldDelegate {
    
    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "icon")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.layer.cornerRadius = 25
        logo.isUserInteractionEnabled = true
        
        return logo
    }()
    
    lazy var appName: UILabel = {
        let name = UILabel()
         name.textAlignment = .center
         name.textColor = .black
         name.text = "eBook"
         name.font = UIFont(name:"Hoefler Text Italic", size: 48.0)
         name.textAlignment = NSTextAlignment.right
         name.numberOfLines = 1
         name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let segmentedControl = UISegmentedControl()
    
    lazy var nameTF: UITextField = {
     let name = UITextField()
      name.placeholder = NSLocalizedString("write", comment: "")
      name.textAlignment = .center
      name.keyboardType = .alphabet
      name.translatesAutoresizingMaskIntoConstraints = false
      name.textColor = UIColor(named: "textColor")
      name.font = UIFont.systemFont(ofSize: 14)
      name.backgroundColor = .lightGray
      name.layer.cornerRadius = 8
        
        return name
    }()

    
    var emailTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .lightGray
        tf.textAlignment = .center
        tf.keyboardType = .emailAddress
        tf.layer.cornerRadius = 8
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = UIColor(named: "textColor")
        tf.attributedPlaceholder = NSAttributedString(
            string: NSLocalizedString("email", comment: ""),
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tf.isSecureTextEntry = false

        return tf
    }()
    
    var passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.textAlignment = .center
        tf.backgroundColor = .lightGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = UIColor(named: "textColor")
        tf.layer.cornerRadius = 8
        tf.attributedPlaceholder = NSAttributedString(
            string: NSLocalizedString("password", comment: ""),
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

        return tf
    }()
    
    lazy var confTF:  UITextField = {
          let conf = UITextField()
         conf.placeholder = NSLocalizedString("conf", comment: "")
         conf.textAlignment = .center
         conf.translatesAutoresizingMaskIntoConstraints = false
         conf.textColor = UIColor(named: "textColor")
         conf.font = UIFont.systemFont(ofSize: 14)
         conf.backgroundColor = .lightGray
         conf.layer.cornerRadius = 8
         conf.isSecureTextEntry = true
        return conf
        
      }()

    let logInButton : TransitionButton = {
        let btn = TransitionButton()
        btn.setTitle("LogIn", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        btn.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
        btn.layer.cornerRadius = 15
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
      return btn
    }()
      
    let signUp : TransitionButton = {
        let btn = TransitionButton()
        btn.setTitle("Sign Up", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        btn.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
        btn.layer.cornerRadius = 15
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(registerBtnPressed), for: .touchUpInside)
      return btn
    }()
      
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
      
      setupUI()
      self.nameTF.delegate = self
      self.emailTF.delegate = self
      self.passwordTF.delegate = self
      self.confTF.delegate = self
     
  }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           nameTF.resignFirstResponder()
           emailTF.resignFirstResponder()
           passwordTF.resignFirstResponder()
           confTF.resignFirstResponder()

                  return true
          }
 
  let stackView : UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .vertical
    $0.distribution = .fillEqually
    $0.spacing = 15
    return $0
  }(UIStackView())
    
        @objc func loginBtnPressed() {
                let email = emailTF.text ?? ""
                let password = passwordTF.text ?? ""
                if email.isEmpty || password.isEmpty {
                  return
                }
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                  if error != nil {
                    print(error as Any)
                    return
                  }
            self.logInButton.startAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
        self.logInButton.stopAnimation(animationStyle: .expand, revertAfterDelay: 0 ) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
            
                let newVC2 = TabVC()
            newVC2.modalPresentationStyle = .fullScreen
            self.present(newVC2, animated: true, completion: nil)
                            }

                        }
                    }
        }
    }
    
        @objc func registerBtnPressed() {
          let name = nameTF.text ?? ""
          let email = emailTF.text ?? ""
          let password = passwordTF.text ?? ""
          if email.isEmpty || password.isEmpty {
                  return
                }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
         if error != nil {
            print(error as Any)
                return
                  }
        self.signUp.startAnimation()
    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
    self.signUp.stopAnimation(animationStyle: .expand, revertAfterDelay: 0 ) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                let newVC2 = TabVC()
            newVC2.modalPresentationStyle = .fullScreen
            self.present(newVC2, animated: true, completion: nil)
                            }
                        }
                    }
        }
        }
    
  }

extension LoginVC {
    
      func setupUI() {
      
        view.backgroundColor = .white
        view.addSubview(stackView)
           setupGradientView()
           stackView.addArrangedSubview(segmentedControl)
           stackView.addArrangedSubview(nameTF)
           stackView.addArrangedSubview(emailTF)
           stackView.addArrangedSubview(passwordTF)
           stackView.addArrangedSubview(confTF)
           stackView.addArrangedSubview(logInButton)
           stackView.addArrangedSubview(signUp)
      
           segmentedControl.insertSegment(withTitle: "Rigester", at: 0, animated: true)
           segmentedControl.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
           
           segmentedControl.setTitle("Rigester", forSegmentAt: 0)
           segmentedControl.insertSegment(withTitle: "Login", at: 1, animated: true)
           segmentedControl.setTitle("Login", forSegmentAt: 1)
           segmentedControl.addTarget(self, action: #selector(Segment), for: .valueChanged)
               NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 350),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.heightAnchor.constraint(equalToConstant: 270)
    ])
  }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
      logoImage.tintColor = UIColor(ciColor: .black)
      logoImage.layer.masksToBounds = true
      logoImage.layer.cornerRadius = 100
      logoImage.contentMode = .scaleAspectFit
      logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 90),
            logoImage.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 70),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            logoImage.heightAnchor.constraint(equalToConstant: 250),
            logoImage.widthAnchor.constraint(equalToConstant: 250),
        ])
        
        view.addSubview(appName)
        NSLayoutConstraint.activate([
            appName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appName.topAnchor.constraint(equalTo: view.topAnchor, constant: 365),
        ])
    }
    
    
  @objc func Segment(_ sender: Any) {
      switch segmentedControl.selectedSegmentIndex {
      case 0:
        nameTF.isHidden = false
        confTF.isHidden = false
        signUp.isHidden = false
        logInButton.isHidden = true
      case 1:
        nameTF.isHidden = true
        confTF.isHidden = true
        signUp.isHidden = true
        logInButton.isHidden = false
      default:
         break;
      }
    }
    
         private func setupGradientView() {
             setupLogoImage()
            let _ = GradientView(self)
        }
}
