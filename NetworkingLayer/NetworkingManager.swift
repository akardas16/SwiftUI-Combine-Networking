import Foundation
import SwiftUI
import Combine

class NetworkingManager{
    
    static let instance = NetworkingManager()
    private let baseUrl = "https://reqres.in"

   /*
    Default QueryItems is empty and default httpMethods is GET
     so, you don't need to write those parameters for GET request
    Example for GET request
    NetworkingManager.instance
        .requestPublisher(path: .users)
    */
   private func request(parameters:QueryItems = .empty,method:httpMethods = .GET,path:Endpoints) async throws -> Data{
        do {
            let url = baseUrl + path.name
            guard var urlPath = URLComponents(string: url) else { throw URLError(.badURL)}
            urlPath.queryItems = parameters.queries
            let mainUrl = urlPath.url!
            var request = URLRequest(url: mainUrl)
            request.httpMethod = method.name
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let (data,_) = try await URLSession.shared.data(for: request)
            return data
        } catch  {
           throw URLError(.badURL)
        }

    }
    
    func requestPublisher(parameters:QueryItems = .empty,method:httpMethods = .GET,path:Endpoints) -> Future<Data,Error>{
       Future { promise in
           Task{
               do{
                   let data = try await self.request(parameters: parameters, method: method, path: path)
                   promise(.success(data))
               }catch let error{
                   promise(.failure(error))
               }
               
           }

       }
   }
}

