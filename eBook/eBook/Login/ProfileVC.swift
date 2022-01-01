//
//  ProfileVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit
import FirebaseFirestore
import Firebase
import FirebaseAuth
import TransitionButton
import FirebaseStorage

class ProfileVC : UIViewController, UIImagePickerControllerDelegate,UITextFieldDelegate, UINavigationControllerDelegate{
    
    let storage = Storage.storage().reference()

    lazy var profileImage: UIImageView = {
        
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
        view.layer.cornerRadius = 25
        view.isUserInteractionEnabled = true
      
        return view
    }()
    
    lazy var tapHere: UILabel = {
        let tap = UILabel()
         tap.textAlignment = .center
         tap.textColor = UIColor.init(white: 5, alpha: -1)
         tap.text = "Tap"
         tap.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
         tap.textAlignment = NSTextAlignment.right
         tap.numberOfLines = 1
         tap.translatesAutoresizingMaskIntoConstraints = false
        return tap
    }()

    lazy var imagePicker : UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        return imagePicker
    }()
    
    let name : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = NSLocalizedString("write", comment: "")
        $0.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
        $0.layer.cornerRadius = 15
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 23)
      
        return $0
    }(UITextField())

    
    let changeLanguage : UIButton = {
        let change = UIButton()
        change.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
        change.translatesAutoresizingMaskIntoConstraints = false
        change.layer.cornerRadius = 15
        change.setTitle(NSLocalizedString("change", comment: ""), for: .normal)
        change.setTitleColor( .black, for: .normal)
        change.addTarget(self, action: #selector(btnChangeLangauge), for: .touchUpInside)
        
        return change
    }()
    
    let shareApp : UIButton = {
        let shareApp = UIButton()
        shareApp.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
        shareApp.translatesAutoresizingMaskIntoConstraints = false
        shareApp.layer.cornerRadius = 15
        shareApp.setTitle(NSLocalizedString("share", comment: ""), for: .normal)
        shareApp.setTitleColor(.black, for: .normal)
        shareApp.addTarget(self, action: #selector(shareTheApp), for: .touchUpInside)
        
        return shareApp
    }()
    
    let signOutButton : TransitionButton = {
        var out = TransitionButton()
        out.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
        out.setTitle(NSLocalizedString("signOut", comment: ""), for: .normal)
        out.setTitleColor(.black, for: .normal)
        out.layer.cornerRadius = 15
        out.translatesAutoresizingMaskIntoConstraints = false
        out.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        
        return out
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientView3()
        setupConstraint()
        self.name.delegate = self
        self.title = NSLocalizedString("profile", comment: "")
        view.backgroundColor = UIColor(named: "Color")
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
               profileImage.addGestureRecognizer(tapRecognizer)

        profileImage.addGestureRecognizer(tapRecognizer)
        profileImage.image = .init(systemName: "455")
        profileImage.tintColor = UIColor(ciColor: .black)
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 100
        profileImage.contentMode = .scaleAspectFit
        profileImage.translatesAutoresizingMaskIntoConstraints = false
       

        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore()
            .document("users/\(currentUserID)")
            .addSnapshotListener{ doucument, error in
                if error != nil {
                    print (error as Any)
                    return
                }
                self.name.text = doucument?.data()?["name"] as? String
                self.profileImage.image = doucument?.data()?["image"] as? UIImage

            }
        
        guard let urlstring = UserDefaults.standard.value(forKey: "url") as? String,
            let url = URL (string: urlstring) else {
                return
        }
        
      let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data, _, error in
                guard let data = data, error == nil else {
                    return
                }
            
          DispatchQueue.main.async {
              let image = UIImage(data: data)
              self.profileImage.image = image
          }
        })
        
        task.resume()
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image =  info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else {
            return
        }
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        storage.child("users/\(currentUserID)").putData(imageData,
                                                metadata: nil,
                                                completion: {_, error in
                               guard error == nil else {
                                   print("Faild to upload")
                                             return
                                    }
   self.storage.child("image/file.png").downloadURL(completion: { url, error in
       guard let url = url, error == nil else {
           return
       }
       
       let urlString = url.absoluteString
       
       DispatchQueue.main.async {
           self.profileImage.image = image
       }
       
       print("Download URL: \(urlString)")
       UserDefaults.standard.set(urlString, forKey: "url")

            })
        })
        
        // upload image data
        // get download url
        // save download url to userDefaults
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss (animated: true, completion: nil)
    }
    
    
    @objc func OpenImageLibrary(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    
    @objc func shareTheApp(sender:UIView){
           UIGraphicsBeginImageContext(view.frame.size)
           view.layer.render(in: UIGraphicsGetCurrentContext()!)
           let image = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()

           let textToShare = "Check out my app"
                                           //Enter the link app here
           if let myWebsite = URL(string: "http://itunes.apple.com/app/idXXXXXXXXX") {
               let objectsToShare = [textToShare, myWebsite, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
               let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

               //Excluded Activities
               activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]

               activityVC.popoverPresentationController?.sourceView = sender
               self.present(activityVC, animated: true, completion: nil)
           }    }
    
   @objc func btnChangeLangauge() {
       
       guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
               return
              }
              if UIApplication.shared.canOpenURL(settingsUrl) {
               UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)")
               })
              }
            }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name.resignFirstResponder()
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            return true
        }
            Firestore.firestore().document("users/\(currentUserID)").updateData([
              "name" : name.text,

            ])

               return true
       }
    
    func setupConstraint() {
        view.addSubview(profileImage)
        view.addSubview(name)
        view.addSubview(changeLanguage)
        view.addSubview(shareApp)
        view.addSubview(signOutButton)
        profileImage.addSubview(tapHere)
        
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            profileImage.heightAnchor.constraint(equalToConstant: 200),
            profileImage.widthAnchor.constraint(equalToConstant: 200),
            
            name.topAnchor.constraint(equalTo: view.topAnchor,constant: 470),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 80),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            name.heightAnchor.constraint(equalToConstant: 40),
            name.widthAnchor.constraint(equalToConstant: 290),
            
            changeLanguage.topAnchor.constraint(equalTo: view.topAnchor, constant: 540),
            changeLanguage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            changeLanguage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            changeLanguage.heightAnchor.constraint(equalToConstant: 40),
            
            shareApp.topAnchor.constraint(equalTo: view.topAnchor, constant: 610),
            shareApp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            shareApp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            shareApp.heightAnchor.constraint(equalToConstant: 40),
            
            signOutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 680),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            signOutButton.heightAnchor.constraint(equalToConstant: 40),
            
            tapHere.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 90),
            tapHere.leftAnchor.constraint(equalTo: profileImage.leftAnchor, constant: 60),
            tapHere.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor)
        ])

    }

    @objc func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.signOutButton.startAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                self.signOutButton.stopAnimation(animationStyle: .expand, revertAfterDelay: 0 ) {
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                        let vc = LoginVC()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
                    }
                }
            }
           
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
         
        }
    }
    
    @objc func imageTapped() {
        print("Image Tapped")
        present(imagePicker, animated: true)
       }
    
    
    private func setupGradientView3() {
        let _ = GradientView(self)
    }
}  

