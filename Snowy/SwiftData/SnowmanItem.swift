//
//  SnowmanItem.swift
//  Snowy
//
//  Created by Evan Plant on 25/11/2025.
//

import Foundation
import SwiftData

@Model class SnowmanItem {
    var snowmanName: String
    var creationDate: Date
    var id = UUID()
    
    init(
        snowmanName: String,
        creationDate: Date,
        id: UUID = UUID()
    ){
        self.snowmanName = snowmanName
        self.creationDate = creationDate
        self.id = id
    }
}
