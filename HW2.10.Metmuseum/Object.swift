//
//  Object.swift
//  HW2.10.Metmuseum
//
//  Created by Dmitrii Onegin on 16.01.2022.
//

import Foundation

struct Object: Decodable {
    
    let objectID: Int
    let accessionYear: String
    let primaryImage: String
    let department: String
    let objectName: String
    let title: String
    let culture: String
    let period: String
    let artistDisplayName: String
    let artistDisplayBio: String
    let objectDate: String
    
    var description: String? {
        """
Период: \(accessionYear)
Департамент: \(department)
Название объекта: \(objectName)
Наименование: \(title)
Культура: \(culture)
Период: \(period)
Имя создателя: \(artistDisplayName)
Био создателя: \(artistDisplayBio)
Дата создания: \(objectDate)
"""
    }
}

    
    
   
