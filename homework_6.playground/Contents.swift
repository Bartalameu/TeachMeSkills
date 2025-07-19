import UIKit

////ДЗ:
//1. Создайте два массива. Первый от 0 до 14, второй от 14 до 30. Объедините их в один
//массив.

let arr1 : [Int] = Array(0...14)
let arr2 : [Int] = Array(14...30)
var arrSum = arr1 + arr2
//2. Создать функцию, которая принимает массив int. Возвести все Int в квадрат.
//Возвратить новый массив.

func squareIntArr  (arr : [Int] ) -> [Int] {
    var arrSqr : [Int] = []
    for each in arr {
    arrSqr.append (each * each)
    }
    return arrSqr
}
let squareArr = squareIntArr(arr: arr1)

    
//3. Создать функцию, которая принимает массив int. Возвратить новый массив с только
//четными элементами.
func arrOnlyEven (arr : [Int]) -> [Int] {
    
    var arrOnlyEven : [Int] = []
    
    for each in arr {
        if each % 2 == 0 {
            arrOnlyEven.append(each)
    } else {print ("This \(each) number isn`t even.") }
    
    }
    return arrOnlyEven

}
//let onlyEven = arrOnlyEven(arr: squareArr)


//1. Создайте кортеж с информацией о книге: название, автор, год издания.
//
//Напишите функцию, принимающую такой кортеж и выводящую красиво оформленную строку:
//“Книга ‘Название’ автора Автор, издана в Год.”




var bookInfo = (book : "The Idiot", author : "Dostoevski" , year : 1869 )


func addBookToLibrary (someBook: (String , String, Int))  {
    69
    let (book, author , year ) = someBook
    
    print ("The book \"\(book)\" writed by \(author) in the \(year) year")

}


//let addBook: () = addBookToLibrary(someBook: bookInfo)



//2. Создайте массив из 5 ваших любимых фильмов.
//
//Добавьте ещё один фильм.
//
//Удалите первый фильм из массива.
//
//Напечатайте список фильмов с номерами, начиная с 1:
//
//1. Название фильма
//


var favFilms = ["The Naked Gun", "The Lord of the Rings", "Blade Runner", "Bronson" ,"Dunkirk" ]


favFilms.insert("The Batman", at: 0)
favFilms.remove(at: 1)

//for (index,film) in favFilms.enumerated() {
//    print("\(index+1). \(film)")
//}

//
//3. Создайте словарь, где ключ — это название страны, а значение — её столица.
//
//Добавьте в словарь минимум 3 страны.
//
//Реализуйте функцию, которая принимает страну и возвращает строку:
//“Столица страны — [столица]”,
//или сообщение: “Информация о стране не найдена.”

var mainCities: [String : String] = ["Czech Republic" : "Prague", "German" : "Berlin", "United Kingdom" : "London" ]

func getMainCity (country : String , dict : [String : String]) -> String {
    var out : String = ""
    if dict.keys.contains(country) {
        out = "Main city of the country \(country) - \(dict[country] ?? "Missed main city for this country")"
    } else {out = "Info about country missed" }
    return out
}

//let mainCity = getMainCity(country: "German", dict: mainCities)

//4. Создайте два множества:
//
//любимые фрукты
//
//фрукты, которые есть дома
//
//Найдите пересечение (что из любимого есть дома).

//Найдите разницу (какие любимые фрукты отсутствуют дома).
let favoriteFruits: Set<String> = ["Apple", "Banana", "Mango", "Strawberry"]
let fruitsAtHome: Set<String> = ["Banana", "Orange", "Apple"]

let difference =  favoriteFruits.subtracting(fruitsAtHome)
let crossing =  fruitsAtHome.intersection(favoriteFruits)


//print(difference)
//print(crossing)


//5. Реализуйте функцию areEqual<T: Equatable>(_ a: T, _ b: T) -> Bool, которая возвращает true, если два значения равны.
//
//Проверьте эту функцию с Int, String и Bool.
//
//+ проверить как работают системные функции высшего порядка со словарями и сетами(map, filter, sort)


func areEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
    if a == b {
        return true
    }
    else {return false}
    
}


areEqual(12, 1)
areEqual(false, true)
areEqual("World", "World")





favFilms.map{x in x.first?.uppercased()
    return x.lowercased()
}

//print(favoriteFruits.filter {$0.hasPrefix("B") })



func sortingFruits ( fruitOne : String, fruitTwo : String) -> Bool{
    
    if fruitOne.contains("an"){
        return true
    
    } else {return false}
}

print(fruitsAtHome.sorted(by: sortingFruits(fruitOne:fruitTwo:)))

