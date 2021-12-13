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
        navController.tabBarItem.accessibilityTextualContext = .console
        navController.navigationBar.prefersLargeTitles = false
    //    rootViewController.navigationItem.title = title
        return navController
      }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //   rgba(229,214,197,255)
        tabBar.backgroundColor = .white 
        tabBar.layer.cornerRadius = 15
        tabBar.barTintColor = .white
        tabBar.layer.masksToBounds = true
        view.backgroundColor = .white
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        
        
        
        viewControllers = [
            createNavController(for: HomeVC() , title: NSLocalizedString("home", comment: ""),image: UIImage(named: "adultsBook")!),
            createNavController(for: ChildsBooks() , title: NSLocalizedString("child", comment: ""),image: UIImage(named: "childsBook")!),
            createNavController(for: FavouriteVC(), title: NSLocalizedString("favourite", comment: ""),image: UIImage(named: "likeBook")!),
            createNavController(for: ProfileVC(), title: NSLocalizedString("profile", comment: ""),image: UIImage(named: "profile")!),
    
     
           
        ]
    }
}
