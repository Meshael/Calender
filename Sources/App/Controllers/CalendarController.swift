//
//  CalendarController.swift
//  
//
//  Created by Mashael Alharbi on 20/03/2023.
//

import Foundation
import Vapor

final class CalendarController {
    
    func create(_ req: Request) throws -> EventLoopFuture<Calenders> {
        let months = try req.content.decode(Calenders.self)
        return months.create(on: req.db).map { months }
    }
    
    func all(_ req: Request) throws -> EventLoopFuture<[Calenders]> {
        Calenders.query(on: req.db).all()
    }
    
    func getid(req:Request) throws -> EventLoopFuture<Calenders> {
        Calenders.find(req.parameters.get("calenderId"), on: req.db)
        .unwrap(or: Abort(.notFound))
    }

    func updata(req:Request) throws -> EventLoopFuture<HTTPStatus> {
        
                let months = try req.content.decode(Calenders.self)
        
                return Calenders.find(months.id, on: req.db)
                    .unwrap(or: Abort(.notFound))
                    .flatMap {
                        $0.title = months.title
                        return $0.update(on: req.db).transform(to: .ok)
                    }
    }


    func delete(req:Request) throws -> EventLoopFuture<HTTPStatus> {
        Calenders.find(req.parameters.get("calenderId"), on: req.db).unwrap(or: Abort(.notFound))
                    .flatMap {
                        $0.delete(on: req.db)
                    }.transform(to: .ok)
    }

}
