import UIKit

//1. Написать функцию, которая:
//- Будет просто выводить в консоль ”Hello, world!”
//.
//- Будет принимать аргумент “имя” и выводить в консоль “Hello, имя” (вызов функции
//должен быть следующим - printHi(“Misha”)).
//- Будет принимать аргумент имя и возвращать строку приветствия “Hello! имя”
//.


func printHi (who name : String )    {
    
    var hi = "Hello!\(name)"
    print("\(hi)")
}
//printHi(who: "Joe")

//2. Написать функцию, которая принимает две строки и возвращает сумму количества
//символов двух строк.

func sumOfLetters(first : String, second : String  ) -> Int{
    
    return first.count + second.count
}


//print("\(sumOfLetters(first: "One", second: "Two"))")

//3. Написать функцию, которая выводит в консоль квадрат переданного числа.
func square (x : Int ) {
    var sqr =  x * x
    print("Square of \(x) is \(sqr)")}
//4. Создать функции, которые будут суммировать, вычитать, умножать и делить числа
//sum(num1:num2:).

func mathOperations (num1 : Int, num2 : Int, sighn : String ) {
    
    switch sighn {
        
    case "+": print("\( num1 + num2)")
    case "*": print("\( num1 * num2)")
    case "/": print("\( num1 / num2)")
    case "-": print("\( num1 - num2)")
    
    default: print("Wrong input!")
}
}

//mathOperations(num1: 3, num2: 5, sighn: "*")

//5. Создать функцию, которая принимает параметры и вычисляет площадь круга.

func culcArea (x : Double)  {
    var area = x * x * Double.pi
    print ("Area for \(x) is \(area.rounded())")
}
//culcArea(x: 5)

//6. Создать функцию, которая принимает логический тип “ночь ли сегодня” и возвращает
//строку с описанием времени суток.

func dayNight (now isNight : Bool ) {
    if isNight {
        print("Now night!")
    } else {print("Now a day!")}
}

//dayNight(now: false)

//7. Создать функцию, принимающую 1 аргумент — число от 0 до 100, и возвращающую
//true, если оно простое, и false, если сложное.



// added variable "logic" for testing
func whatNumber (x : Int) -> Bool {
    var logic : Bool
    switch x {
    case 0...100:
        if  x % 2 == 0 || x % 3 == 0 {
            logic = false
            print("The choosed number is complex , Bool = \(logic)")
        }
        else {
            logic = true
            print("The choosed number is simple , Bool = \(logic)")
        }
    default :
    logic = false
        
    }
    return logic
}
    
//    whatNumber(x: 10)

//8. Создать функцию, принимающую 1 аргумент — номер месяца (от 1 до 12), и
//возвращающую время года, которому этот месяц принадлежит (зима, весна, лето или
//осень).

func wichMonth (now month : Int) {
    
    switch month {
    case 3...5 : print("Today is spring")
    case 6...8 :  print("Today is summer")
    case 9...11 : print("Today is autumn")
    case 12,1,2 :  print("Today is winter")
    default : print("You on the wrong planet")
    }
}
//wichMonth(now: 1)

//9*
//. Создать функцию, которая считает факториал введённого числа.



func factorial (x : Int) -> Int {
    if x == 0 {
        return 1
    } else {
        var index = 1
        var result = 1
        repeat {
            result *= index
            index += 1
            
        } while index <= x
        print("\(result)")
        return result
    }
}



//factorial(x: 10)

//10*
//. Создать функцию, которая выводит все числа последовательности Фибоначчи до
//введённого индекса. Например fib(n:6) -> 0, 1, 1, 2, 3, 5, 8

func fibonaci (index : Int) {
    var f1 = 1
    var f2 = 1
    var x = 0
    var sum = 0
    var out : [Int] = [0,1]
    repeat {
        sum = f1 + f2
        f1 = f2
        f2 = sum
        x += 1
        out.append(f1)
    } while x < index - 1
    
    for num in out {
        print("\(num)")
    }
    
    
}

//fibonaci(index: 6)

//11*
//. Создать функцию, которая считает сумму цифр четырехзначного числа,
//переданного в параметры функции


func sumOfDigits ( for number : Int) {
    
    var arr = String (number)
    var sum : Int = 0
    
    for num in arr  {
            sum += Int(num.wholeNumberValue!)
    }
    print ("\(sum)")
}

//sumOfDigits(for: 1111)



//
//Дополнительно(функции высшего порядка:
//1. Есть массив целых чисел. Необходимо получить массив строк, где каждое число возведено в квадрат и записано как текст.

var someNumbers = [1, 1, 2, 3, 4, 5, 8, 10, 11, 13]

var someClosure : ([Int]) -> [String] = { numbers in
    var adapted : [String] = [""]
    for num in numbers {
        
        adapted.append(String(num * num))
    }
     return adapted
}

func stringAdapter(arr : [Int], operation : ([Int]) -> [String])  {
    
    let result = operation (arr)
    
    for words in result {
        print("\(words)")
    }
    
}

//stringAdapter(arr: someNumbers, operation: someClosure)


//2. Отфильтровать только чётные числа из массива.

var filtred = someNumbers.filter {$0 % 2 == 0}

//for dig in filtred {
//    print("\(dig)")
//}

//3. Напечатать каждую строку из массива, добавив к ней её номер (нумерация с 1).
var someWords = ["One", "Two", "Three", "MoreThenFive"]

//var addetNumToString = someWords.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, String) throws -> Result##(Result, String) throws -> Result##(_ partialResult: Result, String) throws -> Result#>) >>>?????????????

var concat : ([String]) -> [String] = {
    word in
    var newArr : [String] = [""]
    var index = 1
    for  x in word {
        newArr.append("\(index) \(x)")
        index += 1
    }
    return newArr
}

func addNumToString (_ words : [String], concatanation : ([String]) -> [String] )  {
    
    let closure = concatanation (words)
    for element in closure {
        print ("\(element)")
    }
}
//addNumToString(someWords, concatanation: concat)

//4. Преобразовать все слова в массиве в верхний регистр.

var upperCase = someWords.map{$0.uppercased()}

//for element in upperCase {
//    print ("\(element)")
//}

//5. Оставить только те слова в массиве, длина которых больше 5 символов.



var moreThenFive = someWords.filter{$0.count > 5}

//for element in moreThenFive {
//    print ("\(element)")
//}


//6. Преобразовать массив чисел в массив строк “четное” / “нечетное”.

var oddEvenArr = [""]

var sorting = someNumbers.map {
    x in
    if x % 2 == 0 {
        "Even"
    }else {"Odd"}
}

//for element in sorting {
//    print ("\(element)")
//}


//7. Объединить все слова из массива в одну строку с пробелами.

var oneString  = someWords.joined(separator: "  ")

print("\(oneString)")




