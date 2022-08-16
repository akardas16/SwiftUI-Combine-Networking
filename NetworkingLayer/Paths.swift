import Foundation
enum Paths{
    case products
    case users
    case time(id:String)
    case listUser
    
    var name:String{
        switch self {
        case .products:
            return "/products"
        case .users:
            return "/api/users"
        case .time(id: let id):
            return "/users/\(id)/time"
        case .listUser:
            return "/api/users?page=2"
        }
    }
    
    
}

