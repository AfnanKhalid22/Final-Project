//
//  ReadEnglish-Child.swift
//  eBook
//
//  Created by Fno Khalid on 02/05/1443 AH.
//

import UIKit
import WebKit
import PDFReader


class ReadEnglishChild: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
     var childBooks: ChildEnglishBook?
    
    var oldTabbarFr: CGRect = .zero
     

    lazy var tableView1: UITableView = {
        let tablaView = UITableView()
        tablaView.translatesAutoresizingMaskIntoConstraints = false
        tablaView.delegate = self
        tablaView.dataSource = self
        tablaView.register(BookChildCell2.self, forCellReuseIdentifier: "bookChildCell2")
        tablaView.backgroundColor = UIColor(named: "Color")
        return tablaView
      }()
    
    let openBook: UIButton = {
       let read = UIButton()
      
        read.translatesAutoresizingMaskIntoConstraints = false
        read.setTitleColor(.black, for: .normal)
        read.setTitle(" Read Book 📖 ", for: .normal)
        read.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        read.layer.cornerRadius = 20
        read.layer.masksToBounds = true
        read.addTarget(self, action: #selector(readChildBook2), for: .touchUpInside)
       
       return read
       
   }()
    
    let shareBook: UIButton = {
       let share = UIButton()
      
        share.translatesAutoresizingMaskIntoConstraints = false
        share.setTitleColor(.black, for: .normal)
        share.setTitle(" Share Book 🔗 ", for: .normal)
        share.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        share.layer.cornerRadius = 20
        share.layer.masksToBounds = true
        share.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)

       return share
       
   }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView1)
        view.addSubview(openBook)
        view.addSubview(shareBook)
        view.backgroundColor = UIColor(named: "Color")
        
        NSLayoutConstraint.activate([
            
            // x: right and left
            // y: up and down
            
            tableView1.topAnchor.constraint(equalTo: view.topAnchor),
            tableView1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView1.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView1.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            openBook.widthAnchor.constraint(equalToConstant: 150),
            openBook.heightAnchor.constraint(equalToConstant: 70),
            openBook.bottomAnchor.constraint(equalTo: tableView1.bottomAnchor,constant: -130),
            openBook.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),

            shareBook.widthAnchor.constraint(equalToConstant: 150),
            shareBook.heightAnchor.constraint(equalToConstant: 70),
            shareBook.topAnchor.constraint(equalTo: tableView1.bottomAnchor,constant: -200),
            shareBook.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80)

        ])
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childBooks?.booksEnglish.count ?? 0

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookChildCell2", for: indexPath) as! BookChildCell2
        
        let b = childBooks!.booksEnglish[indexPath.row]
        
        cell.childnameLabel.text = b.bookNameE
        cell.childbookImage.image = UIImage(named: b.bookImageE)
        cell.bookAuther.text = b.autherE
        cell.childPagesN.text = b.pageNumberE
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
    
    @objc func readChildBook2() {
        
        let pdfVC = pdfChildEnglish()
        
        pdfVC.opendEngilahBook = childBooks?.name
        pdfVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(pdfVC,animated: true)
   }
    
           //share
          @objc func sharePressed (_ sender: Any) {
              let shareBook = UIActivityViewController(activityItems: [self.childBooks?.name ?? ""], applicationActivities: nil)
              
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

class BookChildCell2: UITableViewCell {
    
  static let identifier = "bookChildCell2"
    
     let childbookImage: UIImageView = {
        let bookImage = UIImageView()
         bookImage.clipsToBounds = false
         bookImage.layer.shadowColor = UIColor.black.cgColor
         bookImage.layer.shadowOpacity = 25.0
         bookImage.layer.shadowRadius = 10
         bookImage.layer.cornerRadius = 20
         bookImage.contentMode = .scaleAspectFill
 
        
        return bookImage
    }()
    
     let childnameLabel: UILabel = {
          let namebook = UILabel()
            namebook.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
            namebook.textAlignment = .center
            namebook.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
            namebook.layer.cornerRadius = 20
            namebook.textColor = .black
            namebook.layer.masksToBounds = true
        
                     return namebook
        
    }()
    
    let bookAuther: UILabel = {
       let auther = UILabel()

         auther.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
         auther.textColor = .black
         auther.textAlignment = .center
         auther.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
         auther.layer.cornerRadius = 20
         auther.layer.masksToBounds = true
       
            return auther
       
   }()
    
    let childPagesN: UILabel = {
       let num = UILabel()

         num.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
         num.textColor = .black
         num.textAlignment = .center
         num.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
         num.layer.cornerRadius = 20
         num.layer.masksToBounds = true
       
             return num
       
   }()
    


 override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)

             contentView.addSubview(childbookImage)
             contentView.addSubview(childnameLabel)
             contentView.addSubview(bookAuther)
             contentView.addSubview(childPagesN)
       
        
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
        
        childbookImage.frame = CGRect(x: 100,
                               y: 10 ,
                               width: 190,
                               height: 300)
        childnameLabel.frame = CGRect(x: 70,
                                   y: 350 ,
                               width: 250,
                               height: 40)
        bookAuther.frame = CGRect(x: 70,
                                   y: 400 ,
                               width: 250,
                               height: 40)
        childPagesN.frame = CGRect(x: 100,
                                   y: 450 ,
                               width: 200,
                               height: 40)
      
        
        
    }

}
