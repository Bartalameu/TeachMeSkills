//
//  ProfileData.swift
//  homework_12
//
//  Created by Vadzim Pappkou on 10.08.2025.
//

import UIKit

struct ProfileData {
    let nameOfUser: String
    let email: String
    let phoneNumber: String
    init(nameOfUser: String, email: String, phoneNumber: String) {
        self.nameOfUser = nameOfUser
        self.email = email
        self.phoneNumber = phoneNumber
    }
}
