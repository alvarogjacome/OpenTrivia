//
//  CustomErrors.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 12/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

enum CustomError: String, Error {
    case invalidRequest = "Invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received form de server was invalid. Please try again."
}
