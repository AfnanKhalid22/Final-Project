//
//  EnglishCell.swift
//  eBook
//
//  Created by Fno Khalid on 19/04/1443 AH.
//

import UIKit


class EnglishCell: UICollectionViewCell {
    
    
    static let identfir = "cell2"
    
    var englishBook: EnglishBook!
    
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
    
        namebook.font = UIFont(name: "AvenirNextCondensed-Medium", size: 14.0)
        namebook.textAlignment = .center
        namebook.textColor = .black
        namebook.layer.cornerRadius = 25
        namebook.layer.masksToBounds = true
        
        return namebook
        
    }()
    
    private let favButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "bookMark"), for: .normal)
        button.addTarget(self, action: #selector(favorite2), for: .touchUpInside)
    
        return button
    }()
    
    @objc func favorite2() {

        if isActive2 {
            isActive2 = false
            favButton2.setImage(UIImage(named: "bookMark"), for: .normal)
        } else {
               isActive2 = true
                favButton2.setImage(UIImage(named: "bookMark2"), for: .normal)
            
            let name2 = nameLabel2.text ?? ""
            let image2 = bookImage2.image ?? UIImage(systemName: "house")
            
            FavoriteServiceEnglish.shared.addToFavorite(favBook: FavEnglish(image: englishBook.image, name: name2))

        }
        
    }
    
    func setCell2(book2: EnglishBook) {
        bookImage2.image = UIImage(named: book2.image)
        nameLabel2.text = book2.name
        self.englishBook = book2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bookImage2)
        contentView.addSubview(nameLabel2)
        contentView.addSubview(favButton2)
        contentView.clipsToBounds = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // x: right and left
        // y: up and down
        
        bookImage2.frame = CGRect(x: -5, y: 0, width: 180, height: 190)
        nameLabel2.frame = CGRect(x: 2, y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 5, height: 40)
        favButton2.frame = CGRect(x: 120, y: contentView.frame.size.height - 55, width: 40, height: 40)
       
    }
}


