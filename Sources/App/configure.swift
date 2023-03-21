import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))


    // Migration Config
    app.migrations.add(CreateCalender())
    app.migrations.add(CreateDay())

    // register routes
    try routes(app)
}
