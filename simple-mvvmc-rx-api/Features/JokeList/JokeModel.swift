import Foundation

struct Joke: Codable, Equatable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
