// The Swift Programming Language
// https://docs.swift.org/swift-book
import Compute


print("Hello, world!")

try await onIncomingRequest { req, res in
    let fetchResponse = try await fetch("https://httpbin.org/json", .options(
            headers: ["user-agent": "swift-compute-runtime"]
        ))
        let text = try await fetchResponse.text()
        try await res.status(200).send(text)
}

let router = Router()

router.get("/status") { req, res in
    try await res.status(.ok).send("OK")
}

router.get("/user/:name") { req, res in
    let name = req.pathParams["name"] ?? ""
    let text = "Hello, \(name)!"
    try await res.status(.ok).send(text)
}



struct User: Codable {
    let name: String
}

// Type of expression is ambiguous without more context
//router.post("/user") { req, res in
//    let user = try await req.body.decode(User.self)
//    try await res.status(.created).send(user)
//}

try await router.listen()
