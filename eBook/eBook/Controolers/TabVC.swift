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
        navController.tabBarItem.badgeColor = .black
        navController.tabBarItem.image = image
        navController.tabBarItem.accessibilityTextualContext = .console
        navController.navigationBar.prefersLargeTitles = true
    //    rootViewController.navigationItem.title = title
        return navController
      }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabBar.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        tabBar.layer.cornerRadius = 15
        tabBar.barTintColor =  UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        tabBar.layer.masksToBounds = true
        view.backgroundColor = .white
        
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }

        UsersService.shared.updateUserInfo(
            user: User(
                id: currentUserId,
                name: "Afnan",
                email: ""
            )
        )
        

        viewControllers = [
            createNavController(for: HomeVC() , title: NSLocalizedString("Home", comment: ""),image: UIImage(named: "adultsBook")!),
            createNavController(for: ChildsBooks() , title: NSLocalizedString("Children", comment: ""),image: UIImage(named: "childsBook")!),
            createNavController(for: FavouriteVC(), title: NSLocalizedString("Favourite", comment: ""),image: UIImage(named: "likeBook")!),
            createNavController(for: ProfileVC(), title: NSLocalizedString("Profile", comment: ""),image: UIImage(named: "profile")!),
    
     
           
        ]
    }
}
