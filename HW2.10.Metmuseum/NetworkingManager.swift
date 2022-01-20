//
//  NetworkingManager.swift
//  HW2.10.Metmuseum
//
//  Created by Dmitrii Onegin on 16.01.2022.
//

import Foundation
import UIKit
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}
    
    func fetchTotalObjects(url: String, complition: @escaping(_ total: Total ) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let total = try JSONDecoder().decode(Total.self, from: data)
                DispatchQueue.main.async {
                    complition(total)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchDataWithAlomafire(_ url: String, completion: @escaping(Result<Total, NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let total = Total.getTotal(from: value)
                    completion(.success(total))
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
    }
}
