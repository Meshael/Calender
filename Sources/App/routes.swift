
import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let calendarController = CalendarController()
    
    app.post("calender", use: calendarController.create)
    
    app.get("calender", use: calendarController.all)
    
    app.put("calender", use: calendarController.updata)
    
    app.delete("calender",":calenderId", use: calendarController.delete)
    
    app.get("calender", ":calenderId", use: calendarController.getid)
    
    try app.register(collection: DayController())
}
