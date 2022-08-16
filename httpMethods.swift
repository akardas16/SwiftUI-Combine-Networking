import Foundation
enum httpMethods {
  case POST,GET,PATCH,DELETE
    
    var name:String {
        switch self {
        case .POST:
           return "POST"
        case .GET:
          return  "GET"
        case .PATCH:
          return  "PATCH"
        case .DELETE:
          return  "DELETE"
        }
    }
}
