//
//  CreateDay.swift
//  
//
//  Created by Mashael Alharbi on 16/03/2023.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

struct CreateDay: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("days")
            .id()
            .field("day", .string)
            .field("event", .string)
            .field("calender_id", .uuid, .references("calender", "id"))
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("days").delete()
    }
    
    
}
