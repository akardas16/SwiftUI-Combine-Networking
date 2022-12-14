import Foundation
enum Endpoints{
    case products
    case users
    case time(id:String)
    case listUser
    case updateUser
    
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
        case .updateUser:
            return "/api/users/2"
        }
    }
    
    
}

