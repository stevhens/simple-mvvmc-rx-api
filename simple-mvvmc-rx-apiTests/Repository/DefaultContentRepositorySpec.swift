import XCTest
import Quick
import Nimble
import RxSwift
import RxTest
import Cuckoo
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
                        Joke(id: 1, type: "type", setup: "setup", punchline: "punchline"),
                        Joke(id: 2, type: "type", setup: "setup", punchline: "punchline")
                    ]
                    let response = testScheduler.createColdObservable([.next(10, mockJokes), .completed(20)])

                    stub(mockNetworkClient) { mock in
                        when(mock.fetchData(from: any())).thenReturn(response.asObservable())
                    }
                    
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
                    let mockJoke = Joke(id: 101, type: "type", setup: "setup", punchline: "punchline")
                    let response = testScheduler.createColdObservable([.next(10, mockJoke), .completed(20)])

                    stub(mockNetworkClient) { mock in
                        when(mock.fetchData(from: any())).thenReturn(response.asObservable())
                    }
                    
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
