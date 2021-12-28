//
//  ReadBookVC.swift
//  eBook
//
//  Created by Fno Khalid on 22/04/1443 AH.
//

import UIKit
import PDFKit

class pdfBook: UIViewController, PDFViewDelegate {
    
    var oldTabbarFr: CGRect = .zero
    var openedBook: String?
    var isSave: Bool = false
    
    //pdf View
    private var pdfView: PDFView?
    
    //pdf document
    private var pdfDocument: PDFDocument?
    
    private var totalPageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // add pdfView to viewController
        pdfView = PDFView(frame: self.view.bounds)
        self.view.addSubview(pdfView!)
        
        
        
        //configure pdf properties
        pdfView?.autoScales = true
        pdfView?.displayMode = .singlePage
        pdfView?.displayDirection = .horizontal
        pdfView?.usePageViewController(true)
        
        
        // pdf path, place pdf file:
        
        print("This is sth:", openedBook ?? "")

        guard let path = Bundle.main.url(forResource: openedBook ?? "" , withExtension: "pdf") else {
            print("unable to locate file")
            
            return
        }
        
        // load pdf
        pdfDocument = PDFDocument(url: path)
        pdfView!.document = pdfDocument
        
        
        //get totalnumber of pages in pdf
        if let total = pdfView?.document?.pageCount {
            totalPageCount = total
        }
        
        //page change
        NotificationCenter.default.addObserver(self, selector: #selector(handlePageChange), name: Notification.Name.PDFViewPageChanged, object: nil)
        
        oldTabbarFr = self.tabBarController?.tabBar.frame ?? .zero
           
    }
    
    @objc func handlePageChange() {
        
        // get current page number
        let currentPageNum = pdfDocument!.index(for: (pdfView?.currentPage)!) + 1
        let pageTotalAndCurrentNumber = "\(currentPageNum)/\(totalPageCount)"
        
        // cahnge Title
        title = " [\(pageTotalAndCurrentNumber)]"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .done, target: self, action: #selector(savePageNumber))
    }
    
    @objc func savePageNumber() {
        if isSave {
            isSave = false
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .done, target: self, action:  #selector(savePageNumber))
        } else {

               isSave = true
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark.fill"), style: .done, target: self, action: #selector(didTap))
        }
//        let bookname = nameLabel.text ?? ""
//        _ = bookImage.image ?? UIImage(systemName: "house")
//        FavoriteService.shared.addToFavorite(favBook: Fav(image: book.image, name: bookname))
        print("save the page")
    }
    
    @objc func didTap() {
        if isSave {
            isSave = true
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .done, target: self, action:  #selector(didTap))
            
        } else {

               isSave = false
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark.fill"), style: .done, target: self, action:  #selector(savePageNumber))
        }
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

