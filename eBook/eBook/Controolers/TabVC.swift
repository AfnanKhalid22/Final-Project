//
//  TabVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit
import FirebaseAuth


class TabVC: UITabBarController {
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                         title: String,
                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
//        navController.tabBarItem.badgeColor = .white
//        navController.navigationBar.tintColor = .white
        navController.tabBarItem.image = image
        navController.tabBarItem.accessibilityTextualContext = .narrative
        navController.navigationBar.prefersLargeTitles = false
    //    rootViewController.navigationItem.title = title
        return navController
      }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //   rgba(229,214,197,255)
        tabBar.backgroundColor = .white //UIColor(red: 230/255, green: 213/255, blue: 197/255, alpha: 0.5)
        tabBar.layer.cornerRadius = 15
        tabBar.barTintColor = .white// UIColor(displayP3Red: 229/255, green:  214/255, blue: 197/255, alpha: 1)
        tabBar.layer.masksToBounds = true
        view.backgroundColor = .white
        
//        guard let currentUserId = Auth.auth().currentUser?.uid else {
//            return
//        }
//
//        UsersService.shared.updateUserInfo(
//            user: User(
//                id: currentUserId,
//                name: "Afnan",
//                email: ""
//            )
//        )
        
        viewControllers = [
            createNavController(for: HomeVC() , title: NSLocalizedString("home", comment: ""),image: UIImage(named: "adultsBook")!),
            createNavController(for: ChildsBooks() , title: NSLocalizedString("child", comment: ""),image: UIImage(named: "childsBook")!),
            createNavController(for: FavouriteVC(), title: NSLocalizedString("favourite", comment: ""),image: UIImage(named: "likeBook")!),
            createNavController(for: ProfileVC(), title: NSLocalizedString("profile", comment: ""),image: UIImage(named: "profile")!),
    
     
           
        ]
    }
}
