//
//  Total.swift
//  HW2.10.Metmuseum
//
//  Created by Dmitrii Onegin on 16.01.2022.
//

import Foundation

struct Total: Decodable {
    let total: Int
    let objectIDs: [Int]
    
    init(total: Int, objectIDs: [Int]) {
        self.total = total
        self.objectIDs = objectIDs
    }
    
    init(totalData: [String: Any]) {
        total = totalData["total"] as? Int ?? 0
        objectIDs = totalData["objectIDs"] as? [Int] ?? []
        
    }
    
    static func getTotal() -> Total{
        Total(total: 10, objectIDs: [1,2,3,4,5,6,7,8,9,10])
    }
    
    static func getTotal(from value: Any) -> Total {
        guard let totalData = value as? [String: Any] else { return Total.getTotal() }
        return Total(totalData: totalData)
    }
    
}
