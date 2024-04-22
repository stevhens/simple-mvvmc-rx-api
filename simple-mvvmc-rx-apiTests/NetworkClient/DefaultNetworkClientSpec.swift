import Foundation
import Quick
import Nimble
import Alamofire
import RxSwift
import Cuckoo
@testable import simple_mvvmc_rx_api

class DefaultNetworkClientSpec: QuickSpec {
    override class func spec() {
        describe("DefaultNetworkClient") {
            var sut: DefaultNetworkClient!
            var networkClient: MockNetworkClient!
            
            beforeEach {
                sut = DefaultNetworkClient()
                networkClient = MockNetworkClient()
            }
            
            afterEach {
                sut = nil
                networkClient = nil
            }
            
            context("when fetching with URL") {
                it("should return the expected data with real URL") {
                    let mockJokes = [
                        Joke(id: 1, type: "type1", setup: "setup1", punchline: "punchline1"),
                        Joke(id: 2, type: "type2", setup: "setup2", punchline: "punchline2"),
                    ]
                    stub(networkClient) { mock in
                        when(mock.fetchData(from: any())).thenReturn(Observable.just(mockJokes))
                    }
                    
                    let url = "https://official-joke-api.appspot.com/jokes/ten"
                    var fetchedData: [Joke]?
                    var fetchError: Error?
                    
                    let observable = sut.fetchData(from: url) as Observable<[Joke]>
                    _ = observable.subscribe(onNext: { data in
                        fetchedData = data
                    }, onError: { error in
                        fetchError = error
                    })
                    
                    expect(fetchedData).toEventuallyNot(beNil())
                    expect(fetchError).toEventually(beNil())
                }
                
                it("should return an error with invalid url") {
                    let url = "https://invalid-url.com"
                    
                    var fetchedData: [Joke]?
                    var fetchError: Error?
                    
                    let observable = sut.fetchData(from: url) as Observable<[Joke]>
                    _ = observable.subscribe(onNext: { data in
                        fetchedData = data
                    }, onError: { error in
                        fetchError = error
                    })
                    
                    expect(fetchedData).toEventually(beNil())
                    expect(fetchError).toEventuallyNot(beNil())
                }
            }
        }
    }
}
