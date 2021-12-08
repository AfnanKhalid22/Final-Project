//
//  ChildBooksData.swift
//  eBook
//
//  Created by Fno Khalid on 02/05/1443 AH.
//

import UIKit


struct ChildArabicBook {
    var image: String
    var name: String
    var booksArabic: Array<BookAChild>
  
}

struct BookAChild {
    let bookImage: String
    let bookName: String
    let auther: String
    let pageNumber: String

}


var arabicChildList = [
     ChildArabicBook(image: "19", name: "البيت الجديد",
                     booksArabic:[
                        BookAChild(bookImage: "19", bookName: "البيت الجديد", auther: "كامل كيلاني", pageNumber: "14")
                        ]),
     ChildArabicBook(image: "20", name: "السندباد البحري",
                     booksArabic:[
                        BookAChild(bookImage: "20", bookName: "السندباد البحري", auther: "كامل كيلاني", pageNumber: "14")
                        ]),
     ChildArabicBook(image: "21", name: "الملك عجيب",
                     booksArabic:[
                        BookAChild(bookImage: "21", bookName: "الملك عجيب", auther: "كامل كيلاني", pageNumber: "14")
                        ]),
     ChildArabicBook(image: "22", name: "النحلة العاملة",
                     booksArabic:[
                        BookAChild(bookImage: "22", bookName: "النحلة العاملة", auther: "كامل كيلاني", pageNumber: "14")
                        ]),
     ChildArabicBook(image: "23", name: "سعفان الكسلان",
                     booksArabic:[
                        BookAChild(bookImage: "23", bookName: "سعفان الكسلان", auther: "كامل كيلاني", pageNumber: "14")
                        ]),
     ChildArabicBook(image: "24", name: "لؤلؤة الصباح",
                     booksArabic:[
                        BookAChild(bookImage: "24", bookName: "لؤلؤة الصباح", auther: "كامل كيلاني", pageNumber: "14")
                        ]),
     ChildArabicBook(image: "25", name: "ذاهب لأطمئن على صديقي",
                     booksArabic:[
                        BookAChild(bookImage: "25", bookName: "ذاهب لأطمئن على صديقي", auther: "كامل كيلاني", pageNumber: "14")
                        ]),
     ChildArabicBook(image: "26", name: "شيماء تحكي",
                     booksArabic:[
                        BookAChild(bookImage: "26", bookName: "شيماء تحكي", auther: "كامل كيلاني", pageNumber: "14")
                        ]),
     ChildArabicBook(image: "27", name: "كيف اصبح الفيل فهد",
                     booksArabic:[
                        BookAChild(bookImage: "27", bookName: "كيف اصبح الفيل فهد", auther: "كامل كيلاني", pageNumber: "14")
                        ]),
]


struct ChildEnglishBook {
    var image: String
    var name: String
    var booksEnglish: Array<BookEChild>
}

struct BookEChild {
    let bookImageE: String
    let bookNameE: String
    let autherE: String
    let pageNumberE: String
}


var englishChildList = [
    ChildEnglishBook(image: "28", name: "Just Enough English Grammar",
                     booksEnglish: [
        BookEChild(bookImageE: "28", bookNameE: "Just Enough English Grammar", autherE: "22", pageNumberE: "wwwwwww")]),
    ChildEnglishBook(image: "29", name: "Nature Trail",
                     booksEnglish: [
        BookEChild(bookImageE: "29", bookNameE: "Nature Trail", autherE: "", pageNumberE: "")]),
    ChildEnglishBook(image: "30", name: "Picture Books",
                     booksEnglish: [
        BookEChild(bookImageE: "30", bookNameE: "Picture Books", autherE: "", pageNumberE: "")]),
    ChildEnglishBook(image: "31", name: "Stars and Planets",
                     booksEnglish: [
        BookEChild(bookImageE: "31", bookNameE: "Stars and Planets", autherE: "", pageNumberE: "")]),
    ChildEnglishBook(image: "32", name: "Tiny Creatures",
                     booksEnglish: [
        BookEChild(bookImageE: "32", bookNameE: "Tiny Creatures", autherE: "", pageNumberE: "")]),
    

]
