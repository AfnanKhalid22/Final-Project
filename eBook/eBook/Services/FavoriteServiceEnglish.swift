//
//  BookService.swift
//  eBook
//
//  Created by Fno Khalid on 21/04/1443 AH.
//

import UIKit
import FirebaseFirestore

class FavoriteServiceEnglish {
    
    
  static let shared = FavoriteServiceEnglish()
    
  let favoriteCollection = Firestore.firestore().collection("Favorite")
    
    
  func addToFavorite(favBook: FavEnglish) {
      favoriteCollection.document(favBook.name).setData([
        "image": favBook.image ,
        "name": favBook.name
       
    ])
  }
    
  func listenToFavoriteBook(completion: @escaping (([FavEnglish]) -> Void)) {
      favoriteCollection.addSnapshotListener { snapshot, error in
      if error != nil {
        return
      }
      guard let documents = snapshot?.documents else { return }
      var favorite: Array<FavEnglish> = []
      for document in documents {
        let data = document.data()
        let fBook = FavEnglish(
            image:(data["image"] as? String) ?? "No Image" ,
            name:(data["name"] as? String) ?? "No Name"
         
        )
          favorite.append(fBook)
      }
      completion(favorite)
    }
  }
}
