//
//  NetworkManager.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetch<T: Decodable>(completionHandler: @escaping (Result<T, CustomError>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://opentdb.com/api.php?amount=20&type=multiple&encode=base64")!) { data, response, error in
            if let _ = error {
                completionHandler(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let game = try decoder.decode(T.self, from: data)
                completionHandler(.success(game))
            } catch {
                completionHandler(.failure(.invalidData))
            }
        }
        .resume()
    }
}
