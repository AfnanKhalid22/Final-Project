//
//  EnglishCell.swift
//  eBook
//
//  Created by Fno Khalid on 19/04/1443 AH.
//

import UIKit


class EnglishCell: UICollectionViewCell {
    
    
    static let identfir = "cell2"
    
    var englishBook: Book!
    
    var isActive2: Bool = false
  
    private let bookImage2: UIImageView = {
        let bookImage = UIImageView()
        bookImage.clipsToBounds = false
        bookImage.layer.shadowColor = UIColor.black.cgColor
        bookImage.layer.shadowOpacity = 9.0
        bookImage.layer.shadowRadius = 10
        bookImage.contentMode = .scaleAspectFit
        bookImage.layer.cornerRadius = 20
  
        
        return bookImage
    }()
    
    private let nameLabel2: UILabel = {
        let namebook = UILabel()
    
        namebook.font = UIFont(name: "AvenirNextCondensed-Medium", size: 23.0)
        namebook.textAlignment = .center
        namebook.textColor = .black
        namebook.layer.cornerRadius = 25
        namebook.layer.masksToBounds = true
        
        return namebook
        
    }()
    
    let autherLabel: UILabel = {
       let auther = UILabel()
        auther.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18.0) //UIFont(name: "Semibold", size: 8.0)
         auther.textColor = .black
         auther.textAlignment = .center
      
       return auther
       
   }()
    
    
    let categoryLabel: UILabel = {
       let category = UILabel()
        category.font = UIFont(name: "Light-Italic", size: 14.0)
        category.textColor = .black
        category.textAlignment = .center
      
       return category
       
   }()
    
    private let favButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "heart1"), for: .normal)
        button.addTarget(self, action: #selector(favorite2), for: .touchUpInside)

        return button
    }()
    
//    private let favButton: UIImageView = {
//        let button = UIImageView()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.isUserInteractionEnabled = true
//        button.layer.cornerRadius = 20
//        button.layer.masksToBounds = true
//        let tap = UITapGestureRecognizer(target: self, action:  #selector(favorite2))
//        button.addGestureRecognizer(tap)
//
//        return button
//    }()
    
    @objc func favorite2() {

        if isActive2 {
            isActive2 = false
            favButton2.setImage(UIImage(named: "heart1"), for: .normal)
        } else {
               isActive2 = true
                favButton2.setImage(UIImage(named: "heart2"), for: .normal)
            
            let name2 = nameLabel2.text ?? ""
            _ = bookImage2.image ?? UIImage(systemName: "house")
            
            FavoriteService.shared.addToFavorite(favBook: Fav(image: englishBook.image, name: name2))

        }
        
    }
//    func favouriteButtonState() {
//        if ( UserDefaults.standard.bool(forKey: "heart")) {
//            favButton.image = UIImage(named: "heart2")
//        } else {
//            favButton.image = UIImage(named: "heart1")
//        }
//    }
    
    func setCell2(book2: Book) {
        bookImage2.image = UIImage(named: book2.image)
        nameLabel2.text = book2.name
        autherLabel.text = book2.by
        categoryLabel.text = book2.category
        self.englishBook = book2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bookImage2)
        contentView.addSubview(nameLabel2)
        contentView.addSubview(autherLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(favButton2)
      //  favouriteButtonState()
        contentView.clipsToBounds = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // x: right and left
        // y: up and down
        
        bookImage2.frame = CGRect(x: -80, y: 15, width: 180, height: 190)
        nameLabel2.frame = CGRect(x: 85, y: contentView.frame.size.height - 210, width: contentView.frame.size.width - 5, height: 40)
        autherLabel.frame = CGRect(x: 75, y: contentView.frame.size.height - 150, width: contentView.frame.size.width - 5, height: 40)
        categoryLabel.frame = CGRect(x: 95, y: contentView.frame.size.height - 100, width: 130, height: 40)
        favButton2.frame = CGRect(x: 230, y: contentView.frame.size.height - 100, width: 40, height: 40)
        
       
       
    }
}


