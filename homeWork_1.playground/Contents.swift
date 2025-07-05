import UIKit

//1. Создать новый Playground
//2. Написать переменные и константы всех базовых типов данных: Int, Bool, Float,
//Double, String. У чисел вывести их минимальные и максимальные значения (Int8/16…
//UInt…), а у строки – количество символов.
let tenthNumMax : Decimal = Decimal.greatestFiniteMagnitude
let tenthNumMin : Decimal = -Decimal.greatestFiniteMagnitude
let dMax : Double  = Double.greatestFiniteMagnitude
let fMax : Float = Float.greatestFiniteMagnitude
let dMin : Double = -Double.greatestFiniteMagnitude
let fMin : Float = -Float.greatestFiniteMagnitude
let numberMax : Int = Int.max
let numberMin : Int = Int.min
let UnumberMax : UInt = UInt.max
let UnumberMin : UInt = UInt.min
let numberMax32 : Int32 = Int32.max
let numberMin32 : Int32 = Int32.min
let UnumberMax32 : UInt32 = UInt32.max
let UnumberMin32 : UInt32 = UInt32.min
let numberMax16 : Int16 = Int16.max
let numberMin16 : Int16 = Int16.min
let UnumberMax16 : UInt16 = UInt16.max
let UnumberMin16 : UInt16 = UInt16.min
let numberMax8 : Int8 = Int8.max
let numberMin8 : Int8 = Int8.min
let UnumberMax8 : UInt8 = UInt8.max
let UnumberMin8 : UInt8 = UInt8.min

var logic : Bool = true
var simbol : Character = "A"
var word : String = "example"


// У строки не может быть максимума символов по скольку эта переменная ограничена оперативной памятью ?


//3. Написать различные выражения с приведением типа. Минимум 8 выражений.
let someDouble : Double = 1.4
let doubleToInt = Int (someDouble)
let doubleToFlout : Float = Float (someDouble)

let someInt16 : Int16 = 12312
let Int16ToUInt16 : UInt16 = UInt16 (someInt16)

let someFloat : Float = 1.1231
let floatToDouble : Double = Double (someFloat)

let someString : String = "Badooms!"
let stringToCharackter : Character = someString.first ?? "a"
//сделал так потому что прямое приведение выдавало ошибку, по скольку  someString.first возвращает опционал . И хотел именно строку в символ перевести.

let someDec : Decimal = 123124112312312312
let decToString : String = String("\(someDec)")

let int8ToInt16 : Int16 = Int16 (numberMax8)
let decToFloat : Float = NSDecimalNumber (decimal: someDec).floatValue
let decToDouble : Double = NSDecimalNumber (decimal: someDec).doubleValue

//4. Произвести различные вычисления с математическими операторами (умножение,
//деление, сложение, вычитание). Выводить результат в консоль в таком виде: 3
//+ 2 = 5 (использовать интерполяцию строк).

var x = 10
var y = 3

var sum = x + y
var multiply = x * y
var divide = x / y
var modulus = x % y

print ("\(x) + \(y) = \(sum)")
print ("\(x) * \(y) = \(multiply)")
print ("\(x) / \(y) = \(divide)")
print ("\(x) % \(y) = \(modulus)")

//5. С помощью if-else необходимо вывести в консоль, ночь ли сегодня (isNight).

var isNight = true
if isNight {
    print ("Now a night.")
} else {print("Now a day.")}

//6. Дана строка, сделать копию этой строки. Вывести копию строки в консоль. Помним,
//что строка – это коллекция символов, по которым можно "пробегаться". Решение let
//str2 = str1; print(str2) не принимается.

var wordToCopy = "Make copy !"
var copy : String = ""
for symbol in wordToCopy {
    copy.append(symbol)
}
print(copy)
//7*. Сделать проверку: является ли число четным: 13, 2, 20, 21, 76.

var arr : [Int] = [13, 2, 20, 21, 76]
var index = 0
repeat  {
    for num in arr {
        index += 1
        if num % 2 == 0 {
            print("\(num) is even")
        }
    }
}while arr.count < index

//8*. В переменной day лежит какое-то число от 1 до 31 (вы задаете сами любое).
//Определить, в какую декаду месяца попадает это число (в первую, вторую или
//третью).

var day = 11

switch day {
case 1...10 :
    print ("Сейчас первая декада месяца ")
case 11...20 :
    print ("Сейчас вторая декада месяца ")
case 21...31 :
    print ("Сейчас третья декада месяца ")
default :
    print (" Неверное число. ")

}


//9*. Дана строка, состоящая из символов, например, “bbppeeyy”
//. Проверить, что
//первым символом этой строки является буква “a” (или любая другая). Если это так –
//вывести 'да', в противном случае -
//‘нет’
//. Затем поменяйте строку, чтобы условие
//соблюдалось. Поэкспериментируйте с разными строками.

var input = "abppeeyy"
var firstChar = input.first
if firstChar == "a" {
    print(firstChar ?? "Some letter ")
}else {print("Wrong letter")}


//10*. Вывести таблицу умножения в консоль с помощью циклов for in.
//

var tableMultiply = [2, 3, 4, 5, 6, 7, 8, 9]


for num in tableMultiply {
    var count = 0
    while count < tableMultiply.count {
        var output = num * tableMultiply[count]
        print ("\(num) * \(tableMultiply[count]) = \(output) ")
        count += 1
    }
    count = 0
}
