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
