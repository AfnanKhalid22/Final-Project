//
//  Data.swift
//  eBook
//
//  Created by Fno Khalid on 19/04/1443 AH.
//

import UIKit

struct Book {
    var image: String
    var name: String
    var readMe: Bool
    var booksA: Array<BookInformation>
  
}

struct FavArabic {
    var image: String
    var name: String
   
}

struct FavEnglish {
    var image: String
    var name: String
   
}

struct BookInformation {
    let bookImage: String
    let bookName: String
    let auther: String
    let pageNumber: String
//    let pdfName: String
}

var bookList = [
    Book(image: "1", name: "كن بخير", readMe: true,
         booksA:[
            BookInformation(bookImage: "1", bookName: "كن بخير",auther: " الكاتب : عائشة العمران",pageNumber: "عدد الصفحات : 144")]),
    Book(image: "2", name: "الرجال من المريخ", readMe: true,
         booksA:[
            BookInformation(bookImage: "2", bookName: "الرجال من المريخ و النساء من الزهرة",auther: " الكاتب : جون غراي", pageNumber: "عدد الصفحات : 188")]),
    Book(image: "3", name: " نظرية الفستق", readMe: true,
         booksA:[
            BookInformation(bookImage: "3", bookName: " نظرية الفستق",auther: " الكاتب : فهد الأحمدي", pageNumber: "عدد الصفحات : 256")]),
    Book(image: "4", name: "مت فارغاً", readMe: true,
         booksA:[
            BookInformation(bookImage: "4", bookName: "مت فارغاً",auther: " الكاتب : تود هنري", pageNumber: "عدد الصفحات : 338")]),
    Book(image: "5", name: " لأنك الله", readMe: true,
         booksA:[
            BookInformation(bookImage: "5", bookName: " لأنك الله",auther: " الكاتب : علي الفيفي", pageNumber: "عدد الصفحات : 192")]),
    Book(image: "6", name: "فن اللامبالاة", readMe: true,
         booksA:[
            BookInformation(bookImage: "6", bookName: "فن اللامبالاة",auther: " الكاتب : مارك مانسون", pageNumber: "عدد الصفحات : 272")]),
    Book(image: "7", name: "أربعون 40", readMe: true,
         booksA:[
            BookInformation(bookImage: "7", bookName: "أربعون 40",auther: " الكاتب : أحمد الشقيري", pageNumber: "عدد الصفحات : 273")]),
    Book(image: "8", name: "الدحيح", readMe: true,
         booksA:[
            BookInformation(bookImage: "8", bookName: "الدحيح ما وراء الكواليس",auther: " الكاتب : طاهر المعتز بالله", pageNumber: "عدد الصفحات : 256")]),
    Book(image: "9", name: "زحمة حكي", readMe: true,
         booksA:[
            BookInformation(bookImage: "9",bookName: "زحمة حكي",auther: " الكاتب : علي نجم", pageNumber: "عدد الصفحات : 201")]),
    Book(image: "10", name: "أسباب للبقاء حياً", readMe: true,
         booksA:[
            BookInformation(bookImage: "10", bookName: "أسباب للبقاء حياً",auther: " الكاتب : مات هيغ", pageNumber: "عدد الصفحات : 218")])
]

struct EnglishBook {
    var image: String
    var name: String
    var readMe: Bool
    var booksB: Array<BookInformation2>
}

struct BookInformation2 {
    let bookImageE: String
    let bookNameE: String
    let autherE: String
    let pageNumberE: String
//    let urlE: String
}

let bookList2 = [
    EnglishBook(image: "11", name: "Words That Change Minds", readMe: true,
                booksB: [
        BookInformation2(bookImageE: "11", bookNameE: "Words That Change Minds", autherE: "Shelle Rose Charvet", pageNumberE: "318")]),
    EnglishBook(image:  "12", name: "It Ends with Us", readMe: true,
                booksB: [
        BookInformation2(bookImageE: "12", bookNameE: "It Ends with Us", autherE: "Colleen Hoover", pageNumberE: "385")]),
    EnglishBook(image: "13", name: "The Power of Habit", readMe: true,
                booksB: [
        BookInformation2(bookImageE: "13", bookNameE: "The Power of Habit: Why We Do What We Do in Life and Business", autherE: "Charles Duhigg", pageNumberE: "276")]),
    EnglishBook(image: "14", name: "The Question Book", readMe: true,
                booksB: [
        BookInformation2(bookImageE: "14", bookNameE: "The Question Book", autherE: "Mikael Krogerus, Roman Tschäppeler", pageNumberE: "133")]),
    EnglishBook(image: "15", name: "The Power of Now ", readMe: true,
                booksB: [
        BookInformation2(bookImageE: "15", bookNameE: "The Power of Now ", autherE: "Eckhart Tolle", pageNumberE: "258")]),
    EnglishBook(image: "16", name: "Finish What You Start", readMe: true,
                booksB: [
        BookInformation2(bookImageE: "16", bookNameE: "Finish What You Start: The Art of Following Through, Taking Action, Executing, & Self-Discipline", autherE: "Peter Hollins", pageNumberE: "133")]),
    EnglishBook(image: "17", name: "Think Again", readMe: true,
                booksB: [
        BookInformation2(bookImageE: "17", bookNameE: "Think Again: How to Reason and Argue", autherE: "Walter Sinnott-Armstrong", pageNumberE: "256")]),
    EnglishBook(image: "18", name: "365 Days", readMe: true,
                booksB: [
        BookInformation2(bookImageE: "18", bookNameE: "365 Days With Self-Discipline", autherE: "Meadows, Martin", pageNumberE: "697")])
     
] 


