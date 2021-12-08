//
//  FavoriteService.swift
//  eBook
//
//  Created by Fno Khalid on 24/04/1443 AH.
//

import UIKit
import FirebaseFirestore



class FavoriteServiceArabic {
    
    
  static let shared = FavoriteServiceArabic()
  let favoriteCollection = Firestore.firestore().collection("Favorite")
    
    
  func addToFavorite(favBook: FavArabic) {
      favoriteCollection.document(favBook.name).setData([
        "image": favBook.image ,
        "name": favBook.name
       
    ])
  }
    
  func listenToFavoriteBook(completion: @escaping (([FavArabic]) -> Void)) {
      favoriteCollection.addSnapshotListener { snapshot, error in
      if error != nil {
        return
      }
      guard let documents = snapshot?.documents else { return }
      var favorite: Array<FavArabic> = []
      for document in documents {
        let data = document.data()
        let fBook = FavArabic(
            image:(data["image"] as? String) ?? "No Image" ,
            name:(data["name"] as? String) ?? "No Name"
         
        )
          favorite.append(fBook)
      }
      completion(favorite)
    }
  }
}
