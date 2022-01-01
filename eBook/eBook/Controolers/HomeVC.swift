//
//  RegisterVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import TransitionButton


class HomeVC: UIViewController {

    var heyName: User?
    var greeting = ""

    var helloLbl: UILabel = {
           var hello =  UILabel()
           hello.translatesAutoresizingMaskIntoConstraints = false
           hello.textColor = .black
           hello.textAlignment = .center
           hello.font = UIFont(name: "Hoefler Text Italic", size: 28)
        
           return hello
       }()
    
    var nameLbl: UILabel = {
           var name =  UILabel()
             name.translatesAutoresizingMaskIntoConstraints = false
             name.textColor = .black
             name.textAlignment = .center
             name.font = UIFont(name: "Hoefler Text Italic", size: 28)
        
              return name
       }()
  //  MuktaMahee Light
    
    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
          logo.image = UIImage(named: "icon")
          logo.translatesAutoresizingMaskIntoConstraints = false
         // logo.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
          logo.layer.cornerRadius = 25
          logo.isUserInteractionEnabled = true
                return logo
    }()
    
    private let label: UILabel = {
        let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text = NSLocalizedString("choose", comment: "")
          label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20.0)
          label.textColor = UIColor(named: "textColor")
          label.textAlignment = .center
          label.layer.cornerRadius = 20
          label.layer.masksToBounds = true
        
                return label
        
    }()
    
    var arabicBtn: TransitionButton = {
        let btn = TransitionButton()
          btn.translatesAutoresizingMaskIntoConstraints = false
          btn.setTitleColor(.black, for: .normal)
          btn.setTitle(NSLocalizedString("arabic", comment: ""), for: .normal)
          btn.clipsToBounds = false
          btn.layer.shadowColor = UIColor.black.cgColor
          btn.layer.shadowOpacity = 9.0
          btn.layer.shadowRadius = 10
          btn.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
          btn.addTarget(self, action: #selector(arabicButtonPressed), for: .touchUpInside)
          btn.cornerRadius = 20
          btn.spinnerColor = .black

               return btn
    }()
    
    var englishBtn: TransitionButton = {
        let btn = TransitionButton()
          btn.translatesAutoresizingMaskIntoConstraints = false
          btn.setTitleColor(.black, for: .normal)
          btn.clipsToBounds = false
          btn.layer.shadowColor = UIColor.black.cgColor
          btn.layer.shadowOpacity = 9.0
          btn.layer.shadowRadius = 10
          btn.setTitle(NSLocalizedString("english", comment: ""), for: .normal)
          btn.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
          btn.addTarget(self, action: #selector(englishButtonPressed), for: .touchUpInside)
          btn.cornerRadius = 20
          btn.spinnerColor = .black
  
               return btn 
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientView2()
        view.backgroundColor = UIColor(named: "Color")//UIColor(red: 230/255, green: 213/255, blue: 197/255, alpha: 0.5)
        
        view.addSubview(arabicBtn)
        view.addSubview(englishBtn)
        view.addSubview(label)
        view.addSubview(logoImage)
        view.addSubview(helloLbl)
//        arabicBtn.layer.shadowColor = UIColor.black.cgColor
//        arabicBtn.layer.shadowOpacity = 10.0
//        arabicBtn.layer.shadowRadius = 10
//        arabicBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        NSLayoutConstraint.activate([
            arabicBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 95),
            arabicBtn.self.heightAnchor.constraint(equalToConstant: 170),
            arabicBtn.self.widthAnchor.constraint(equalToConstant: 170),
            arabicBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 550),
            
            englishBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -95),
            englishBtn.self.heightAnchor.constraint(equalToConstant: 170),
            englishBtn.self.widthAnchor.constraint(equalToConstant: 170),
            englishBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 550),
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -225),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -50),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50),
            
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            logoImage.heightAnchor.constraint(equalToConstant: 300),
            logoImage.widthAnchor.constraint(equalToConstant: 300),
        
            helloLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            helloLbl.widthAnchor.constraint(equalToConstant: 320),
            helloLbl.heightAnchor.constraint(equalToConstant: 50)
        ])
    
        greetingLogic()
        
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore()
            .document("users/\(currentUserID)")
            .addSnapshotListener{ doucument, error in
                if error != nil {
                    print (error as Any)
                    return
                }
                self.heyName?.name = doucument?.data()?["name"] as? String ?? ""
               

            }
    }
    
    func greetingLogic() {
        
        let date = NSDate()
        let calendar = NSCalendar.current
        let currentHour = calendar.component(.hour, from: date as Date)
        let hourInt = Int(currentHour.description)!

        if hourInt >= 12 && hourInt <= 16 {
            greeting = NSLocalizedString("Good Afternoon", comment: "")
        }
        else if hourInt >= 7 && hourInt <= 12 {
            greeting = NSLocalizedString("Good Morning", comment: "")
        }
        else if hourInt >= 16 && hourInt <= 20 {
            greeting = NSLocalizedString("Good Evening", comment: "")
            
        }
        else if hourInt >= 20 && hourInt <= 24 {
            greeting = NSLocalizedString("Good Night", comment: "")
            
        }
        else if hourInt >= 0 && hourInt <= 7 {
            greeting = NSLocalizedString("Sleep", comment: "")
        }
        
          helloLbl.text = greeting //+ ", " + nameTF.text!.capitalized + "!"

    }


    
    @objc func arabicButtonPressed() {
        arabicBtn.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.arabicBtn.stopAnimation(animationStyle: .expand, revertAfterDelay: 0 ) {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                    
                   let arabicPage = ArabicVC()
                    arabicPage.navigationItem.largeTitleDisplayMode = .never
                    self.navigationController?.pushViewController(arabicPage,animated: true)
                }
            }
        }
    }
    
    @objc func englishButtonPressed() {
        englishBtn.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.englishBtn.stopAnimation(animationStyle: .expand, revertAfterDelay: 0 ) {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                        let englishPage = EnglishVC()
                    englishPage.navigationItem.largeTitleDisplayMode = .never
             self.navigationController?.pushViewController(englishPage,animated: true)
                }
            }
        }
    }
    
    private func setupGradientView2() {
        let _ = GradientView(self)
    }
}
