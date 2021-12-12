//
//  Book2.swift
//  eBook
//
//  Created by Fno Khalid on 22/04/1443 AH.
//

import UIKit
import WebKit
import PDFReader


class ReadEnglishBook: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var booksE: EnglishBook?
    var oldTabbarFr: CGRect = .zero

    lazy var tableView2: UITableView = {
        let t = UITableView()
          t.translatesAutoresizingMaskIntoConstraints = false
          t.delegate = self
          t.dataSource = self
          t.register(BookCell2.self, forCellReuseIdentifier: BookCell2.identifier)
          t.backgroundColor = UIColor(named: "Color")
        
                return t
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView2)
        view.addSubview(openBook)
        view.addSubview(shareEBook)
        view.backgroundColor = UIColor(named: "Color")
        
        NSLayoutConstraint.activate([
            tableView2.topAnchor.constraint(equalTo: view.topAnchor),
            tableView2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView2.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView2.leftAnchor.constraint(equalTo: view.leftAnchor),
            // x: right and left
            // y: up and down
            openBook.widthAnchor.constraint(equalToConstant: 150),
            openBook.heightAnchor.constraint(equalToConstant: 70),
            openBook.bottomAnchor.constraint(equalTo: tableView2.bottomAnchor,constant: -130),
            openBook.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),

            shareEBook.widthAnchor.constraint(equalToConstant: 150),
            shareEBook.heightAnchor.constraint(equalToConstant: 70),
            shareEBook.topAnchor.constraint(equalTo: tableView2.bottomAnchor,constant: -200),
            shareEBook.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80)

            
        ])
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksE?.booksB.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView2.dequeueReusableCell(withIdentifier: "EbookCell", for: indexPath) as! BookCell2
        
        let b = booksE!.booksB[indexPath.item]
        
           cell.nameLabelE.text = b.bookNameE
           cell.bookImageE.image = UIImage(named: b.bookImageE)
           cell.autherE.text = b.autherE
           cell.pagesNE.text = b.pageNumberE
           cell.backgroundColor = UIColor(named: "Color")
        
        
                  return cell
    }
    
    var selectedIndex = -1
    
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          if indexPath.row == selectedIndex {
            return 354
          }else {
            return 500
          }
        }
    
    let openBook: UIButton = {
       let read = UIButton()
      
         read.translatesAutoresizingMaskIntoConstraints = false
         read.setTitleColor(.black, for: .normal)
         read.setTitle("Read Book 📖 ", for: .normal)
         read.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
         read.layer.borderColor = UIColor.darkGray.cgColor
         read.layer.borderWidth = 3.0
         read.layer.cornerRadius = 20
         read.layer.masksToBounds = true
         read.addTarget(self, action: #selector(readBook), for: .touchUpInside)
       
                return read
       
   }()
    
    let shareEBook: UIButton = {
       let share = UIButton()
      
          share.translatesAutoresizingMaskIntoConstraints = false
          share.setTitleColor(.black, for: .normal)
          share.setTitle("Share Book 🔗", for: .normal)
          share.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
          share.layer.borderColor = UIColor.darkGray.cgColor
          share.layer.borderWidth = 3.0
          share.layer.cornerRadius = 20
          share.layer.masksToBounds = true
          share.addTarget(self, action: #selector(sharePressed2), for: .touchUpInside)

              return share
       
   }()
    
    
    @objc func readBook() {
        
        let pdfVC = pdfBook2()
        pdfVC.openedEBook = booksE?.name
        pdfVC.navigationItem.largeTitleDisplayMode = .never
           navigationController?.pushViewController(pdfVC,animated: true)
      
   }
    
    //share
   @objc func sharePressed2(_ sender: Any) {
       let shareBook = UIActivityViewController(activityItems: [self.booksE?.name ?? ""], applicationActivities: nil)
       shareBook.popoverPresentationController?.sourceView = self.view
     self.present(shareBook, animated: true, completion: nil)
   }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.frame = .zero
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.frame = oldTabbarFr
    }

}

class BookCell2: UITableViewCell {
    
  static let identifier = "EbookCell"
    
    let pdfTitle = Date()
    
    @objc var webView: WKWebView!
    
     let bookImageE: UIImageView = {
        let bookImage = UIImageView()
          bookImage.clipsToBounds = false
          bookImage.layer.shadowColor = UIColor.black.cgColor
          bookImage.layer.shadowOpacity = 25.0
          bookImage.layer.shadowRadius = 10
          bookImage.layer.cornerRadius = 20
          bookImage.contentMode = .scaleAspectFill
          bookImage.backgroundColor = UIColor(named: "Color")

             return bookImage
    }()
    
     let nameLabelE: UILabel = {
        let namebook = UILabel()
           namebook.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
           namebook.textAlignment = .center
           namebook.textColor = .black
           namebook.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
           namebook.layer.borderColor = UIColor.darkGray.cgColor
           namebook.layer.borderWidth = 3.0
           namebook.layer.cornerRadius = 20
           namebook.layer.masksToBounds = true
        
                 return namebook
        
    }()
    
    let autherE: UILabel = {
       let auther = UILabel()

          auther.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
          auther.textColor = .black
          auther.textAlignment = .center
          auther.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
          auther.layer.borderColor = UIColor.darkGray.cgColor
          auther.layer.borderWidth = 3.0
          auther.layer.cornerRadius = 20
          auther.layer.masksToBounds = true
       
              return auther
       
   }()
    
    let pagesNE: UILabel = {
       let num = UILabel()
         num.text = ""
         num.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
         num.textColor = .black
         num.textAlignment = .center
         num.backgroundColor = UIColor(red: 216/255, green: 198/255, blue: 174/255, alpha: 1)
         num.layer.borderColor = UIColor.darkGray.cgColor
         num.layer.borderWidth = 3.0
         num.layer.cornerRadius = 20
         num.layer.masksToBounds = true
       
              return num
       
   }()
    


override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(bookImageE)
        contentView.addSubview(nameLabelE)
        contentView.addSubview(autherE)
        contentView.addSubview(pagesNE)
       
        
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(named: "Color")
   
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: has not implement>>>")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // x: right and left
        // y: up and down
        
        bookImageE.frame = CGRect(x: 100,
                               y: 10 ,
                               width: 190,
                               height: 300)
        nameLabelE.frame = CGRect(x: 25,
                                   y: 350 ,
                               width: 350,
                               height: 40)
        autherE.frame = CGRect(x: 70,
                                   y: 400 ,
                               width: 250,
                               height: 40)
        pagesNE.frame = CGRect(x: 100,
                                   y: 450 ,
                               width: 200,
                               height: 40)
      
        
        
    }

}

