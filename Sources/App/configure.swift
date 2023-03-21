import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))


    app.databases.use(.postgres(hostname: "localhost",
                                username: "postgres",
                                password: "1234",
                               database: "calendersdb"),
                      as: .psql)
    
    
    // Migration Config
    app.migrations.add(CreateCalender())
    app.migrations.add(CreateDay())

    // register routes
    try routes(app)
}
