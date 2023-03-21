//
//  Day.swift
//  
//
//  Created by Mashael Alharbi on 16/03/2023.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class Day: Model, Content {
    
    static let schema = "days"
    
    @ID(key: .id)
    var id: UUID? // primary Key
    
    @Field(key: "day")
    var title: String
    
    @Field(key: "event")
    var body: String
    
    // belongs to - Day belong to calenders
    @Parent(key: "calender_id") // Foren Key
    var calender: Calenders
    
    init() { }
    
    init(id: UUID? = nil, title: String, body: String, calenderId: UUID) {
        self.id = id
        self.title = title
        self.body = body
        self.$calender.id = calenderId
    }
}
