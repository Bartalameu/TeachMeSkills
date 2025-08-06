import UIKit

//ДЗ:
//1. Создать объект “Школа” со свойствами: массив учеников, название школы, адрес (адрес -
//новый объект с координатами x, y, street name) и директор (у директора новые поля:
//experience, рейтинг. Директор наследуется от класса Person (name:surname:age)).
//У ученика хранить имя, фамилию, номер класса, кортеж “название предмета - оценка”
//. Ученик
//наследуется от Person.
//У ученика сделать конструктор со всеми параметрами, добавить дефолтные значения к
//некоторым из них.
//Написать метод для ученика, выводящий информацию о студенте в формате
//“Фамилия Имя (Класс)
//предмет: оценка
//предмет: оценка”
//.
//Написать метод для школы, который выводит информацию о школе.
//Уделите особое внимание выбору, что использовать: класс или структуру, var или let,
//модификаторы доступа.
//

class Person {
    let name : String
    let surname : String
    var age : Int
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    
}

class Student : Person {
    
   private var numberOfClass : Int
   private var cource : (name: String, mark: Int)
    init( name: String = "John", surname: String = "Doe", age: Int = 1,  numberOfClass: Int = 1, cource: (name: String , mark: Int )) {
        self.numberOfClass = numberOfClass
        self.cource = cource
        super.init(name: name, surname: surname, age: age)
            }
    
    func getInfo () {
        print("Surname: \(surname) Name: \(name) class: \(numberOfClass) \ncource: \(cource.name) mark: \(cource.mark)")
    }
}


class Director : Person {
    var expirience : Int
    var rating : Int
    init(name: String, surname: String, age: Int, expirience: Int, rating: Int) {
            self.expirience = expirience
            self.rating = rating
            super.init(name: name, surname: surname, age: age)
        }
}

class Address {
    let nameOfStreet : String
    let x : Double
    let y : Double
    init(nameOfStreet: String, x: Double, y: Double) {
        self.nameOfStreet = nameOfStreet
        self.x = x
        self.y = y
    }
    
    
}


class School {
    var arrStudents : [Student]
    let nameSchool : String
    let address : Address
    init(arrStudents: [Student], nameSchool: String, address: Address) {
        self.arrStudents = arrStudents
        self.nameSchool = nameSchool
        self.address = address
    }
    
    func getInfo () {
        print (" Address of school: \(address) and coordinates - x:\(address.x) y: \(address.y)")
    }
}



var students = [Student(name : "Oleg", surname:  "Bykov", age : 10, cource: (name: "Physic", mark: 1)), Student(name : "Alex", surname:  "Naumov", age : 15, cource: (name: "History", mark: 2))]
let school = School(arrStudents: students, nameSchool: "Gymnasiun №10", address: Address(nameOfStreet: "ul. Pervogo maya 1", x: 1234.123, y: 123.123))
let director = Director(name: "Main", surname: "Person", age: 50, expirience: 10, rating: 8)

//for human in students {
//    human.getInfo()
//}
//school.getInfo()


//2. Создайте протокол PaymentMethod с требованиями:
//
//Свойство c (текущий баланс)
//
//Метод pay(amount: Double) -> Bool
//
//Реализуйте протокол в:
//
//Классе CreditCard (должен списывать сумму + 1% комиссии)
//
//Структуре CryptoWallet (должен проверять, хватает ли криптовалюты)
//
protocol PaymentMethod {
    var balance : Double {get set}
    func pay (amount : Double) -> Bool
    
}



class CreditCard : PaymentMethod {
    var balance: Double
    init(balance: Double) {
        self.balance = balance
    }
    
    func pay(amount: Double) -> Bool {
        switch amount {
        case let x where x > 0 && x + (x * 0.01) <= balance :
            balance -= x + (x * 0.01)
        //print("Transaction succesful, your balance now is ***\(balance.formatted())***")
            return true
        default :
          //  print("Transactioin is not succseful, wrong value of paymant or low balance")
            return false
        }
        
    }
}


//creditCard.pay(amount: 5.5)


class CryptoWallet : PaymentMethod {
    var balance: Double
    init(balance: Double) {
        self.balance = balance
    }
    func pay(amount: Double) -> Bool {
        if amount > 0 && amount <= balance {
            balance -= amount
            return true
        } else {
            //print("Transactioin is not succseful, wrong value of paymant or low balance")
            return false
        }
    }
}


//Напишите функцию processPayment(using method: PaymentMethod, amount: Double), которая обрабатывает платеж.

func processPayment (using pay : PaymentMethod, amount : Double) {
    let status = pay.pay(amount: amount)
    let balance = pay.balance
    if status {
        print("Transaction succesful, your balance now is ***\(balance.formatted())***")
    }
    else {print("Transactioin is not succseful, wrong value of paymant or low balance")}
    
    
}
var creditCard = CreditCard(balance: 10.345)
var cryptoWallet = CryptoWallet(balance: 100.345)

processPayment(using: cryptoWallet, amount: 100)
