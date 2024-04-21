import XCTest
import Quick
import Nimble
import RxSwift
import RxTest
@testable import simple_mvvmc_rx_api

class DefaultContentRepositorySpec: QuickSpec {
    override class func spec() {
        describe("DefaultContentRepository") {
            var sut: DefaultContentRepository!
            var mockNetworkClient: MockNetworkClient!
            var testScheduler: TestScheduler!
            var disposeBag: DisposeBag!
            
            beforeEach {
                disposeBag = DisposeBag()
                testScheduler = TestScheduler(initialClock: 0)
                mockNetworkClient = MockNetworkClient()
                sut = DefaultContentRepository(networkClient: mockNetworkClient)
            }
            
            afterEach {
                sut = nil
                mockNetworkClient = nil
                testScheduler = nil
                disposeBag = nil
            }
            
            context("when fetching joke list") {
                it("should return correct jokes") {
                    let mockJokes = [
                        Joke(id: 1, type: "general", setup: "Why did the chicken cross the road?", punchline: "To get to the other side!"),
                        Joke(id: 2, type: "general", setup: "What do you get when you cross a snowman and a vampire?", punchline: "Frostbite!"),
                    ]
                    let response = testScheduler.createColdObservable([.next(10, mockJokes), .completed(20)])
                    mockNetworkClient.stubbedJokeListResult = response.asObservable()
                    
                    var fetchedJokes: [Joke]?
                    sut.fetchJokeList()
                        .subscribe(onNext: { jokes in
                            fetchedJokes = jokes
                        })
                        .disposed(by: disposeBag)
                    
                    testScheduler.start()
                    
                    expect(fetchedJokes).to(equal(mockJokes))
                }
            }
            
            context("when fetching a joke by ID") {
                it("should return correct joke") {
                    let mockJoke = Joke(id: 101, type: "general", setup: "Why don't scientists trust atoms?", punchline: "Because they make up everything!")
                    let response = testScheduler.createColdObservable([.next(10, mockJoke), .completed(20)])
                    mockNetworkClient.stubbedJokeResult = response.asObservable()
                    
                    var fetchedJoke: Joke?
                    sut.fetchJoke(id: 101)
                        .subscribe(onNext: { joke in
                            fetchedJoke = joke
                        })
                        .disposed(by: disposeBag)
                    
                    testScheduler.start()
                    
                    expect(fetchedJoke).to(equal(mockJoke))
                }
            }
        }
    }
}

class MockNetworkClient: NetworkClient {
    var stubbedJokeListResult: Observable<[Joke]>?
    var stubbedJokeResult: Observable<Joke>?
    
    func fetchData<T>(from urlString: String) -> Observable<T> where T : Decodable {
        if T.self == [Joke].self {
            return stubbedJokeListResult as! Observable<T>
        } else {
            return stubbedJokeResult as! Observable<T>
        }
    }
}
