//
//  ChildsBooks.swift
//  eBook
//
//  Created by Fno Khalid on 02/05/1443 AH.
//

import UIKit
import TransitionButton

class ChildsBooks: UIViewController {
    
    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
          logo.image = UIImage(named: "childs")
          logo.translatesAutoresizingMaskIntoConstraints = false
          logo.isUserInteractionEnabled = true
                return logo
    }()
    
    private let label: UILabel = {
        let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text = NSLocalizedString("choose", comment: "")
          label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20.0)
          label.textColor = .black
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
          btn.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
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
          btn.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
          btn.addTarget(self, action: #selector(englishButtonPressed), for: .touchUpInside)
          btn.layer.cornerRadius = 20
          btn.spinnerColor = .black
          btn.cornerRadius = 20
  
               return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientView2()
        view.backgroundColor = UIColor(named: "Color")
        
        view.addSubview(arabicBtn)
        view.addSubview(englishBtn)
        view.addSubview(label)
        view.addSubview(logoImage)
        arabicBtn.layer.shadowColor = UIColor.black.cgColor
        arabicBtn.layer.shadowOpacity = 10.0
        arabicBtn.layer.shadowRadius = 10
        arabicBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        NSLayoutConstraint.activate([
            arabicBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 95),
            arabicBtn.self.heightAnchor.constraint(equalToConstant: 170),
            arabicBtn.self.widthAnchor.constraint(equalToConstant: 170),
            arabicBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 550),
            
            
            englishBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -95),
            englishBtn.self.heightAnchor.constraint(equalToConstant: 170),
            englishBtn.self.widthAnchor.constraint(equalToConstant: 170),
            englishBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 550),
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -225),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -50),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50),
            
            
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            logoImage.heightAnchor.constraint(equalToConstant: 400),
            logoImage.widthAnchor.constraint(equalToConstant: 400)
        
        ])
        
    }
    
    @objc func arabicButtonPressed() {
        arabicBtn.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
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
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.englishBtn.stopAnimation(animationStyle: .expand, revertAfterDelay: 0 ) {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                        let englishChildPage = ChildEnglish()
             englishChildPage.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(englishChildPage,animated: true)
                }
            }
        }
    }
    
    private func setupGradientView2() {
        let _ = GradientView(self)
    }
}

