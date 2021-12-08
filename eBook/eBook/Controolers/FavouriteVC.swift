//
//  FavouriteVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit

class FavouriteVC : UIViewController , UITableViewDelegate, UITableViewDataSource{

    
    
    var fBook: Array<FavArabic> = []
    
    var selectedIndex = -1

    
    lazy  var bookTV: UITableView = {
          let tableV = UITableView()
          tableV.translatesAutoresizingMaskIntoConstraints = false
          tableV.delegate = self
          tableV.dataSource = self
          tableV.register(FavouriteCell.self, forCellReuseIdentifier: "Fav")
          tableV.isHidden = false
          tableV.backgroundColor = UIColor(named: "Color")
          
          return tableV
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Color")
        self.title = "Favorite Books"
        view.reloadInputViews()
        
        view.addSubview(bookTV)
        NSLayoutConstraint.activate([
            bookTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            bookTV.topAnchor.constraint(equalTo: view.topAnchor),
            bookTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            bookTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
        FavoriteServiceArabic.shared.listenToFavoriteBook { favBook in
                       self.fBook = favBook
                       self.bookTV.reloadData()
            
        }
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fBook.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Fav", for: indexPath) as! FavouriteCell
        
        let a = fBook[indexPath.row]
        
        cell.nameLabel2.text = a.name
        cell.bookImage2.image = UIImage(named: a.image)
        cell.backgroundColor = UIColor(named: "Color")
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
          return 354
        }else {
          return 190
        }
      }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        
        let cell = fBook[indexPath.row]
        let alertcontroller = UIAlertController(title: "Delete Favorite Book"
                                                , message: "Are you sure you want to delete this Book?"
                                                , preferredStyle: UIAlertController.Style.alert
        )
        
              alertcontroller.addAction(
                      UIAlertAction(title: "cancel",
                                    style: UIAlertAction.Style.default,
                                    handler: { Action in print("...")
            })
            
        )
        
        alertcontroller.addAction(
            UIAlertAction(title: "Delete",
                          style: UIAlertAction.Style.destructive,
                          handler: { Action in
                if editingStyle == .delete {
                    self.fBook.remove(at: indexPath.row)
                    self.bookTV.deleteRows(at: [indexPath], with: .fade)
                }
                self.bookTV.reloadData()
            })
            
        )
        
        self.present(alertcontroller, animated: true, completion: nil)
    
    }
}

