//
//  NetworkManager.swift
//  WeatherForecastPM
//
//  Created by P.M. Class on 4/27/21.
//

import Foundation

final class NetworkManager<T: Codable> {
    
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) {
                    (data, response, error) in
                    guard error == nil else {
                        print(String(describing: error!))
                        completion(.failure(.error(err: error!.localizedDescription)))
                        return
                    }
                    
                    // This is done in case our call to the site does not respond.
                    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        completion(.failure(.invalidResponse))
                        return
                    }
                    
                    // If retreiving the date fails, we want to return with invalid data.
                    guard let data = data else {
                        completion(.failure(.invalidData))
                        return
                    }
                    
                    // Json transfers the data between the client (our app) and the server (Open Weather Map).
                    do {
                        let json = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(json))
                    } catch let err {
                        print(String(describing: err))
                        completion(.failure(.decodingError(err: err.localizedDescription)))
                    }
                    
                }.resume()
            }
        }
    
enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingError(err: String)
}
