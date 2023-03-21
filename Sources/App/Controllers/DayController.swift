//
//  DayController.swift
//  
//
//  Created by Mashael Alharbi on 20/03/2023.
//

import Foundation
import Vapor

struct DayController: RouteCollection {
    
        func boot(routes: RoutesBuilder) throws {
            let days = routes.grouped("days")
            days.get(use: all)
            days.post(use: create)

            days.group(":daysid") { days in
                days.put(use: update)
                days.delete(use: delete)
            }
        }
    
    func create(_ req: Request) throws -> EventLoopFuture<Day> {
           let days = try req.content.decode(Day.self)
           return days.create(on: req.db).map { days }
       }
   
       func all(_ req: Request) throws -> EventLoopFuture<[Day]> {
           Day.query(on: req.db).all()
       }


    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
  
                  let days = try req.content.decode(Day.self)
  
                  return Day.find(days.id, on: req.db)
                      .unwrap(or: Abort(.notFound))
                      .flatMap {
                          $0.title = days.title
                          $0.body = days.body
                          
                          return $0.update(on: req.db).transform(to: .ok)
                      } 
      }
    
    
    func delete(req:Request) throws -> EventLoopFuture<HTTPStatus> {
        Day.find(req.parameters.get("daysid"), on: req.db).unwrap(or: Abort(.notFound))
                    .flatMap {
                        $0.delete(on: req.db)
                    }.transform(to: .ok)
    }
    }

