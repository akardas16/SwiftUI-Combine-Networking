import Foundation
enum httpMethods {
  case POST,GET,PUT,PATCH,DELETE
    
    var name:String {
        switch self {
        case .POST:
           return "POST"
        case .PUT:
           return "PUT"
        case .GET:
          return  "GET"
        case .PATCH:
          return  "PATCH"
        case .DELETE:
          return  "DELETE"
        }
    }
}
