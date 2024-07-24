//
//  ErrorMessage.swift
//  MyProject
//
//  Created by Nagarro on 2024/07/22.
//

import Foundation

enum ErrorMessage: String ,Error{
    case invalidMovie = "This Movie created an invalid request.  Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this movie. Please try again."
    case alreadyInFavorites = "You've already favorited this movie. You must REALLY like them!"
}
