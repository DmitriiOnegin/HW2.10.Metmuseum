//
//  NetworkingManager.swift
//  HW2.10.Metmuseum
//
//  Created by Dmitrii Onegin on 16.01.2022.
//

import Foundation
import UIKit

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
                    print("total: \(total.total)")
                    print(total.objectIDs.count)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
