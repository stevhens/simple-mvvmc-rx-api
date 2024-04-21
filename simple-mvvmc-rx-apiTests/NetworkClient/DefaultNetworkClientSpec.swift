import Foundation
import Quick
import Nimble
import Alamofire
import RxSwift
@testable import simple_mvvmc_rx_api

class DefaultNetworkClientSpec: QuickSpec {
    override class func spec() {
        describe("DefaultNetworkClient") {
            var sut: DefaultNetworkClient!
            var mockInterceptor: Interceptor!
            var mockSession: Session!
            
            beforeEach {
                sut = DefaultNetworkClient()
                
                mockInterceptor = Interceptor { request, session, completion in
                    completion(.success(request))
                } retryHandler: { request, session, error, completion in
                    completion(.retryWithDelay(1.0))
                }
                
                mockSession = Session(interceptor: mockInterceptor)
            }
            
            context("when fetching with URL") {
                it("should return the expected data with real URL") {
                    let url = "https://official-joke-api.appspot.com/jokes/ten"
                    
                    mockSession.request(url).response { _ in }
                    
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
                    
                    mockSession.request(url).response { _ in }
                    
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
