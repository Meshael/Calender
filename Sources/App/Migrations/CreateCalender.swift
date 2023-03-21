//
//  CreateCalender.swift
//  
//
//  Created by Mashael Alharbi on 15/03/2023.
//

import Foundation
import Fluent
import FluentPostgresDriver
//import Vapor


//Creating Database tabel
struct CreateCalender: Migration {
    
    // Deleting , Updating , Adding
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("calender") // table name
            .id()
            .field("month", .string) // column name
            .create()
    }
  
    //Undo
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("calender").delete() // drop the table
    }
}
