import XCTest
import RxSwift
import Quick
import Nimble
import Cuckoo
@testable import simple_mvvmc_rx_api

class JokeListViewModelSpec: QuickSpec {
    override class func spec() {
        describe("JokeListViewModel") {
            var viewModel: JokeListViewModel!
            var contentRepository: MockContentRepository!
            var coordinator: MockJokeListCoordinator!

            beforeEach {
                contentRepository = MockContentRepository()
                coordinator = MockJokeListCoordinator(navigationController: .init())
                viewModel = JokeListViewModel(contentRepository: contentRepository, coordinator: coordinator)
                
                stub(coordinator) { mock in
                    when(mock.showJokeDetail(jokeID: any())).thenDoNothing()
                }
            }

            afterEach {
                contentRepository = nil
                coordinator = nil
                viewModel = nil
            }

            context("when fetching joke list") {
                it("should have initial false value, isLoading to true after fetching and then false") {
                    expect(viewModel.isLoading.value).to(beFalse())

                    var loadingHistory: [Bool] = []

                    let disposable = viewModel.isLoading
                        .subscribe(onNext: { isLoading in
                            loadingHistory.append(isLoading)
                        })

                    let jokes = [
                        Joke(id: 1, type: "type", setup: "setup", punchline: "punchline"),
                        Joke(id: 2, type: "type", setup: "setup", punchline: "punchline")
                    ]
                    stub(contentRepository) { mock in
                        when(mock.fetchJokeList()).thenReturn(Observable.just(jokes))
                    }
                    viewModel.fetchJokeList()

                    expect(loadingHistory).toEventually(contain(true))
                    expect(loadingHistory).toEventually(contain(false))
                    disposable.dispose()
                }

                it("should fetch joke list successfully") {
                    let jokes = [
                        Joke(id: 1, type: "type", setup: "setup", punchline: "punchline"),
                        Joke(id: 2, type: "type", setup: "setup", punchline: "punchline")
                    ]
                    stub(contentRepository) { mock in
                        when(mock.fetchJokeList()).thenReturn(Observable.just(jokes))
                    }

                    viewModel.fetchJokeList()
                    verify(contentRepository, times(1)).fetchJokeList()
                    expect(try? viewModel.jokeList.value()).to(equal(jokes))
                    expect(viewModel.error.value).to(beNil())
                }

                it("should handle error") {
                    let testError = NSError(domain: "TestError", code: 101, userInfo: nil)
                    stub(contentRepository) { mock in
                        when(mock.fetchJokeList()).then { _ in
                            return Observable.error(testError)
                        }
                    }

                    viewModel.fetchJokeList()

                    verify(contentRepository, times(1)).fetchJokeList()
                    expect(try? viewModel.jokeList.value()).to(beEmpty())
                    expect(viewModel.error.value as? NSError).to(equal(testError))
                }
            }

            context("when showing joke detail") {
                it("should call coordinator's showJokeDetail(id)") {
                    let jokeID = 101

                    viewModel.showJokeDetail(jokeID: jokeID)
                    verify(coordinator, times(1)).showJokeDetail(jokeID: equal(to: jokeID))
                }
            }
        }
    }
}
