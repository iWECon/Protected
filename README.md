# Protected

Awesome `os_unfair_lock`  wrapper.

> From ![Alamofire](https://github.com/Alamofire/Alamofire)


## How to use

#### Define

```swift
class User {
    
    // Use dynamicProperty
    
    @Protected var token: Data?
    @Protected var historyAvatarUrls: [URL] = []
    @Protected var balance: Int64 = 0
    
}
```

#### Write / Read

###### Write
```swift
$token.write { data in
    data?.append(Data()) // or append other some Data
}

$historyAvatarUrlStrings.append("new url string of avatar")

$balance.write { v in
    v = 10
}
```
###### Read

```swift
let currentBalance = $balance.read { $0 }
// or
// $balance.value

let currentToken = $token.value // or $token.read { $0 }

let tmpAvatarUrls = $historyAvatarUrlStrings.value // or $historyAvatarUrlStrings.read { $0 }
```


## Install

#### Swift Package Manager

```swift
.package(url: "https://github.com/iWECon/Protected", from: "1.0.0")
```
