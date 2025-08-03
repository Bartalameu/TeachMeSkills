//
//  Person.swift
//  homework_10
//
//  Created by Vadzim Pappkou on 03.08.2025.
//
import UIKit

class Person {
   
   var name: String
   var gender: String
   var age: Int
   var occupation: String
   init(name: String = "Jon Doe", gender: String = "male", age: Int = 1, occupation: String = "none") {
       self.name = name
       self.gender = gender
       self.age = age
       self.occupation = occupation
   }
   
}
