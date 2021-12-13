//
//  ArabicCell.swift
//  eBook
//
//  Created by Fno Khalid on 19/04/1443 AH.
//

import UIKit
import FirebaseFirestore


class ArabicCell: UICollectionViewCell {
    
    static let identfir = "cell"
    
     var book: Book!
    
    var isActive: Bool = false
  
     let bookImage: UIImageView = {
        let bookImage = UIImageView()
         bookImage.clipsToBounds = false
         bookImage.layer.shadowColor = UIColor.black.cgColor
         bookImage.layer.shadowOpacity = 9.0
         bookImage.layer.shadowRadius = 10
         bookImage.contentMode = .scaleAspectFit
         bookImage.layer.cornerRadius = 20
        
                return bookImage
    }()
    
     let nameLabel: UILabel = {
        let namebook = UILabel()
          namebook.font = UIFont(name: "AvenirNextCondensed-Medium", size: 23.0)
          namebook.textColor = .black
          namebook.textAlignment = .right
       
        return namebook
        
    }()
    
    let autherLabel: UILabel = {
       let auther = UILabel()
         auther.font = UIFont(name: "Semibold", size: 16.0)
         auther.textColor = .black
         auther.textAlignment = .right
      
       return auther
       
   }()
    
    
    let categoryLabel: UILabel = {
       let category = UILabel()
        category.font = UIFont(name: "Light-Italic", size: 14.0)
        category.textColor = .black
        category.textAlignment = .right
      
       return category
       
   }()
    
    private let favButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setImage(UIImage(named: "heart1"), for: .normal)
        button.addTarget(self, action: #selector(addfavoriteBook), for: .touchUpInside)
    
        return button
    }()
    
    @objc func addfavoriteBook() {
        print("hi")
        if isActive {
            isActive = false
            favButton.setImage(UIImage(named: "heart1"), for: .normal)
        } else {

               isActive = true
                favButton.setImage(UIImage(named: "heart2"), for: .normal)
        }
        
        let bookname = nameLabel.text ?? ""
        _ = bookImage.image ?? UIImage(systemName: "house")
        FavoriteService.shared.addToFavorite(favBook: Fav(image: book.image, name: bookname))
    }
    

    
    func setCell(book: Book) {
        bookImage.image = UIImage(named: book.image)
        nameLabel.text = book.name
        autherLabel.text = book.by
        categoryLabel.text = book.category
        self.book = book
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        contentView.addSubview(bookImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(autherLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(favButton)
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // x: right and left
        // y: up and down
        
        bookImage.frame = CGRect(x: 120, y: 15, width: 180, height: 190)
        nameLabel.frame = CGRect(x: -80, y: contentView.frame.size.height - 210, width: contentView.frame.size.width - 5, height: 40)
        autherLabel.frame = CGRect(x: -75, y: contentView.frame.size.height - 150, width: contentView.frame.size.width - 5, height: 40)
        categoryLabel.frame = CGRect(x: -15, y: contentView.frame.size.height - 100, width: 130, height: 40)
        favButton.frame = CGRect(x: -50, y: contentView.frame.size.height - 100, width: 45, height: 45)
        
       
    }
    
}
