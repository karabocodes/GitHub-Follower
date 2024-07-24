//
//  NetworkManager.swift
//  MyProject
//
//  Created by Nagarro on 2024/07/22.
//

import UIKit
class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseUrl = "https://api.themoviedb.org/3"
    private let apiKey = "YOUR_API_KEY" // Replace with your actual API key
    
    private init() {}
    
    func getMovies(page: Int, completionHandler: @escaping (Result<[Movie], ErrorMessage>) -> Void) {
        let endpoint = "\(baseUrl)/discover/movie?api_key=\(apiKey)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completionHandler(.failure(.invalidMovie))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let _ = error {
                completionHandler(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.unableToComplete))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.unableToComplete))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movieResponse = try decoder.decode([String: [Movie]].self, from: data)
                if let movies = movieResponse["results"] {
                    completionHandler(.success(movies))
                } else {
                    completionHandler(.failure(.invalidData))
                }
            } catch {
                completionHandler(.failure(.invalidData))
            }
        }

        task.resume()
    }

//class NetworkManager {
//    
//    static let shared = NetworkManager()
//    private let baseUrl = "https://api.github.com" // "https://api.themoviedb.org/3"
////    let cache = NSCache<NSString, UIImage>()
////    let decoder = JSONDecoder()
//    
//    private init() {
////        decoder.keyDecodingStrategy  = .convertFromSnakeCase
////        decoder.dateDecodingStrategy = .iso8601
//    }
//    
//    func getFollowers(for movieName: String, page: Int, completionHandler: @escaping (Result<[Follower], ErrorMessage>) -> Void) {
//        let endpoint = "\(baseUrl)/3/discover/movie"
//        ///3/discover/movie
//        //url didnt work
//        guard let url = URL(string: endpoint) else {
//            completionHandler(.failure(.invalidMovie))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            if let _ = error {
//                completionHandler(.failure(.unableToComplete))
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completionHandler(.failure(.unableToComplete))
//                return
//            }
//
//            guard let data = data else {
//                completionHandler(.failure(.unableToComplete))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let followers = try decoder.decode([Follower].self, from: data)
//                completionHandler(.success(followers))
//            } catch {
//                completionHandler(.failure(.invalidData))
//            }
//        }
////
//        task.resume()
//    }
    
//    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
//        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
//        
//        guard let url = URL(string: endpoint) else {
//            throw GFError.invalidUsername
//        }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw GFError.invalidResponse
//        }
//        
//        do {
//            return try decoder.decode([Follower].self, from: data)
//        } catch {
//            throw GFError.invalidData
//        }
//    }
//    
//    func getUserInfo(for username: String) async throws -> User {
//        let endpoint = baseUrl + "\(username)"
//        guard let url = URL(string: endpoint) else { throw GFError.invalidUsername }
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw GFError.invalidResponse }
//        
//        do {
//            return try decoder.decode(User.self, from: data)
//        } catch {
//            throw GFError.invalidData
//        }
//    }
//    
//    func downloadImage(from urlString: String) async -> UIImage? {
//        let cacheKey = NSString(string: urlString)
//        if let image = cache.object(forKey: cacheKey) { return image }
//        
//        // Intentionally not handling errors; use placeholder image if something goes wrong
//        guard let url = URL(string: urlString) else { return nil }
//        
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            guard let image = UIImage(data: data) else { return nil }
//            self.cache.setObject(image, forKey: cacheKey)
//            return image
//        } catch {
//            return nil
//        }
//        
//    }
}
