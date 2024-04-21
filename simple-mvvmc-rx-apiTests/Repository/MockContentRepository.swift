import XCTest
import RxSwift
@testable import simple_mvvmc_rx_api

class MockContentRepository: ContentRepository {
    var jokeToReturn: Joke?
    var jokesToReturn: [Joke]?
    var errorToReturn: Error?

    func fetchJoke(id: Int) -> Observable<Joke> {
        if let joke = jokeToReturn {
            return Observable.just(joke)
        } else if let error = errorToReturn {
            return Observable.error(error)
        } else {
            return Observable.empty()
        }
    }
    
    func fetchJokeList() -> Observable<[Joke]> {
        if let jokes = jokesToReturn {
            return Observable.just(jokes)
        } else if let error = errorToReturn {
            return Observable.error(error)
        } else {
            return Observable.empty()
        }
    }
}
