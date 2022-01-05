//
//  ChildsBooks.swift
//  eBook
//
//  Created by Fno Khalid on 02/05/1443 AH.
//

import UIKit
import TransitionButton



class ChildsBooks: UIViewController {
    
    var heyName = "Hey"
    var greeting = ""

    var helloLbl: UILabel = {
           var hello =  UILabel()
           hello.translatesAutoresizingMaskIntoConstraints = false
           hello.textColor = UIColor(named: "textColor")
           hello.textAlignment = .center
           hello.font = UIFont(name: "Hoefler Text Italic", size: 20)
        
           return hello
       }()
    
    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
          logo.image = UIImage(named: "childs")
          logo.translatesAutoresizingMaskIntoConstraints = false
          logo.isUserInteractionEnabled = true
          logo.clipsToBounds = true
          logo.addSubview(arabicBtn)
          logo.addSubview(englishBtn)
                return logo
    }()
    
//    private let label: UILabel = {
//        let label = UILabel()
//          label.translatesAutoresizingMaskIntoConstraints = false
//          label.text = NSLocalizedString("choose", comment: "")
//          label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20.0)
//          label.textColor = .black
//          label.textAlignment = .center
//          label.layer.cornerRadius = 20
//          label.layer.masksToBounds = true
//
//                return label
//
//    }()
    
    var arabicBtn: TransitionButton = {
        let btn = TransitionButton()
          btn.translatesAutoresizingMaskIntoConstraints = false
          btn.setTitleColor(.black, for: .normal)
          btn.setTitle(NSLocalizedString("arabic", comment: ""), for: .normal)
          btn.clipsToBounds = false
          btn.layer.shadowColor = UIColor.black.cgColor
          btn.layer.shadowOpacity = 9.0
          btn.layer.shadowRadius = 10
          btn.backgroundColor = .systemPurple //UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
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
        btn.backgroundColor = .systemYellow//UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
          btn.addTarget(self, action: #selector(englishButtonPressed), for: .touchUpInside)
          btn.layer.cornerRadius = 20
          btn.spinnerColor = .black
          btn.cornerRadius = 20
  
               return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    setupGradientView2()
        view.backgroundColor = UIColor(named: "Color")// UIColor(red: 230/255, green: 213/255, blue: 197/255, alpha: 0.5)
        
    //    view.addSubview(label)
        view.addSubview(logoImage)
        view.addSubview(helloLbl)
        arabicBtn.layer.shadowColor = UIColor.black.cgColor
        arabicBtn.layer.shadowOpacity = 10.0
        arabicBtn.layer.shadowRadius = 10
        arabicBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        NSLayoutConstraint.activate([
            arabicBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -25),
            arabicBtn.self.heightAnchor.constraint(equalToConstant: 60),
            arabicBtn.self.widthAnchor.constraint(equalToConstant: 60),
            arabicBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 355),
            
            
            englishBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -95),
            englishBtn.self.heightAnchor.constraint(equalToConstant: 80),
            englishBtn.self.widthAnchor.constraint(equalToConstant: 80),
            englishBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 540),
            
            
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -50),
//            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50),
            
            
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 25),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            logoImage.heightAnchor.constraint(equalToConstant: 550),
            logoImage.widthAnchor.constraint(equalToConstant: 550),
        
            
            helloLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            helloLbl.widthAnchor.constraint(equalToConstant: 300),
            helloLbl.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        greetingLogic()
        
    }
    
    func greetingLogic() {
        let date = NSDate()
        let calendar = NSCalendar.current
        let currentHour = calendar.component(.hour, from: date as Date)
        let hourInt = Int(currentHour.description)!

        if hourInt >= 12 && hourInt <= 16 {
            greeting = NSLocalizedString("Good AfternoonB", comment: "")
        }
        else if hourInt >= 7 && hourInt <= 12 {
            greeting = NSLocalizedString("Good MorningB", comment: "")
        }
        else if hourInt >= 16 && hourInt <= 20 {
            greeting = NSLocalizedString("Good EveningB", comment: "")
            
        }
        else if hourInt >= 20 && hourInt <= 24 {
            greeting = NSLocalizedString("Good NightB", comment: "")
            
        }
        else if hourInt >= 0 && hourInt <= 7 {
            greeting = NSLocalizedString("SleepB", comment: "")
        }

        helloLbl.text = greeting
    }

    
    @objc func arabicButtonPressed() {
        arabicBtn.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now()+0) {
            self.arabicBtn.stopAnimation(animationStyle: .expand, revertAfterDelay: 0 ) {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                   let arabicChildPage = ChildArabic()
                       arabicChildPage.navigationItem.largeTitleDisplayMode = .never
                    self.navigationController?.pushViewController(arabicChildPage,animated: true)
                }
            }
        }
    }
    


    @objc func  englishButtonPressed() {
        englishBtn.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now()+0) {
            self.englishBtn.stopAnimation(animationStyle: .expand, revertAfterDelay: 0 ) {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                        let englishChildPage = ChildEnglish()
             englishChildPage.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(englishChildPage,animated: true)
                }
            }
        }
    }
    
//    private func setupGradientView2() {
//        let _ = GradientView(self)
//    }
}

