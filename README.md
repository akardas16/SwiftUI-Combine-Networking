# SwiftUI-Combine-Networking
This repository shows how handle Rest API's in SwiftUI and Combine

* **Endpoints** enum includes paths which will be added the end of base URL


* **QueryItems** enum includes parameters for requests *Example to authenticate user, we need to email and password from user*


* **httpMethods** enum includes some main httpmethods **GET, POST, PUT, PATCH, DELETE** 

# Example of usages


## GET REQUEST
```swift
NetworkingManager.instance
            .requestPublisher(path: .listUser)
            .decode(type: [UserModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: {[unowned self] arrayModel in
                print(arrayModel)
               // self.arrayModel = arrayModel
            }.store(in: &cancallable)
```
 

## POST REQUEST
```swift
 NetworkingManager.instance
            .requestPublisher(parameters:.createUser(name: name, job: job),method: .POST, path: .users)
            .decode(type: ResponseModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: {[unowned self] response in
                print(response)
                //check response to see whats going on
            }.store(in: &cancallable)
```

## PUT REQUEST
```swift
 NetworkingManager.instance
            .requestPublisher(parameters:.updateUser(name: name, job: job),method: .PUT, path: .updateUser)
            .decode(type: NewUserModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: {[unowned self] response in
                print(response)
                //response can return a boolean which indicates request was succesfull or not
            }.store(in: &cancallable)

```

## DELETE REQUEST 

* All user will be deleted
```swift
   NetworkingManager.instance
            .requestPublisher(method: .DELETE, path: .users)
            .decode(type: DeleteResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: {[unowned self] response in
                print(response)
            }.store(in: &cancallable)

```

## Warning
* if models are not matches response, you may get fail while decoding. 
* more public requests can be find https://reqres.in/ website
