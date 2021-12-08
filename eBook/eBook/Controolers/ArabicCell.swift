//
//  ArabicCell.swift
//  eBook
//
//  Created by Fno Khalid on 19/04/1443 AH.
//

import UIKit
import FirebaseFirestore

    var favoritBook: [Book] = []

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
          namebook.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
          namebook.textColor = .black
          namebook.textAlignment = .right
       
        return namebook
        
    }()
    
    private let favButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setImage(UIImage(named: "bookMark"), for: .normal)
        button.addTarget(self, action: #selector(addfavoriteBook), for: .touchUpInside)
    
        return button
    }()
    
    @objc func addfavoriteBook() {
        
        if isActive {
            isActive = false
            favButton.setImage(UIImage(named: "bookMark"), for: .normal)
        } else {

               isActive = true
                favButton.setImage(UIImage(named: "bookMark2"), for: .normal)

        }
        
        let bookname = nameLabel.text ?? ""
        _ = bookImage.image ?? UIImage(systemName: "house")
        FavoriteServiceArabic.shared.addToFavorite(favBook: FavArabic(image: book.image, name: bookname))
    }
    
    func setCell(book: Book) {
        bookImage.image = UIImage(named: book.image)
        nameLabel.text = book.name
        self.book = book
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        contentView.addSubview(bookImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(favButton)
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // x: right and left
        // y: up and down
        
        bookImage.frame = CGRect(x: -5, y: 0, width: 180, height: 190)
        nameLabel.frame = CGRect(x: 5, y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 5, height: 40)
        favButton.frame = CGRect(x: 2, y: contentView.frame.size.height - 55, width: 40, height: 40)
       
       
    }
    
}
