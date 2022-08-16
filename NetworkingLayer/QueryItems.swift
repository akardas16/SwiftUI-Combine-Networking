import Foundation
//Some example queries
enum QueryItems{
    case login(email:String,password:String)
    case signup(email:String,password:String)
    case saveBio(bio:String)
    case createUser(name:String,job:String)
    case updateUser(name:String,job:String)
    case empty
    
    var queries:[URLQueryItem] {
        switch self {
        case .login(let email, let password):
            return [URLQueryItem(name: "email", value: email),
                    URLQueryItem(name: "password", value: password)]
        case .signup(let email, let password):
            return [URLQueryItem(name: "email", value: email),
                    URLQueryItem(name: "password", value: password)]
        case .saveBio(let bio):
            return [URLQueryItem(name: "userBio", value: bio)]
            
        case .empty:
            return []
        case .createUser(name: let name, job: let job):
            return [URLQueryItem(name: "name", value: name),
            URLQueryItem(name: "job", value: job)]
        case .updateUser(name: let name, job: let job):
            return [URLQueryItem(name: "name", value: name),
            URLQueryItem(name: "job", value: job)]
        }
        
    }
    
}

