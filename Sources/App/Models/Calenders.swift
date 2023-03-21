//
//  Calenders.swift
//  
//
//  Created by Mashael Alharbi on 15/03/2023.
//

import Foundation
import Fluent
import Vapor

final class Calenders: Model, Content {
    
    static let schema = "calender" // table name
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "month")
    var title: String

    
    // has many - Calender has many days
    @Children(for: \.$calender)
    var days: [Day]
    
    init() { }
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
