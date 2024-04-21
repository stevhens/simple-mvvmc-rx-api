import XCTest
import RxSwift
import Quick
import Nimble
@testable import simple_mvvmc_rx_api

class JokeDetailViewModelSpec: QuickSpec {
    override class func spec() {
        describe("JokeDetailViewModel") {
            var viewModel: JokeDetailViewModel!
            var contentRepository: MockContentRepository!
            var coordinator: MockJokeDetailCoordinator!

            beforeEach {
                contentRepository = MockContentRepository()
                coordinator = MockJokeDetailCoordinator(navigationController: .init(), jokeID: 101)
                viewModel = JokeDetailViewModel(contentRepository: contentRepository, coordinator: coordinator)
            }

            afterEach {
                contentRepository = nil
                coordinator = nil
                viewModel = nil
            }

            context("when fetching joke") {
                it("should have initial false value, isLoading to true after fetching and then false") {
                    expect(viewModel.isLoading.value).to(beFalse())

                    var loadingHistory: [Bool] = []

                    let disposable = viewModel.isLoading
                        .subscribe(onNext: { isLoading in
                            loadingHistory.append(isLoading)
                        })

                    viewModel.fetchJoke(id: 101)

                    expect(loadingHistory).toEventually(contain(true))

                    expect(loadingHistory).toEventually(contain(false))

                    disposable.dispose()
                }

                it("should fetch joke successfully") {
                    let joke = Joke(id: 101, type: "", setup: "", punchline: "")
                    contentRepository.jokeToReturn = joke

                    viewModel.fetchJoke(id: 101)

                    expect(try? viewModel.joke.value()).to(equal(joke))
                    expect(viewModel.error.value).to(beNil())
                }

                it("should handle error") {
                    let testError = NSError(domain: "TestError", code: 101, userInfo: nil)
                    contentRepository.errorToReturn = testError

                    viewModel.fetchJoke(id: 101)

                    expect(try? viewModel.joke.value()).to(beNil())
                    expect(viewModel.error.value as? NSError).to(equal(testError))
                }
            }

            context("when dismissing page") {
                it("should call coordinator's dismissPage method") {
                    viewModel.dismissPage()
                    expect(coordinator.dismissPageCalled).to(beTrue())
                }
            }
        }
    }
}

class MockJokeDetailCoordinator: JokeDetailCoordinator {
    var dismissPageCalled = false

    override func dismissPage() {
        dismissPageCalled = true
    }
}
