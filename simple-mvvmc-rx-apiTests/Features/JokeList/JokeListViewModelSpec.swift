import XCTest
import RxSwift
import Quick
import Nimble
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
                    contentRepository.jokesToReturn = jokes

                    viewModel.fetchJokeList()

                    expect(try? viewModel.jokeList.value()).to(equal(jokes))
                    expect(viewModel.error.value).to(beNil())
                }

                it("should handle error") {
                    let testError = NSError(domain: "TestError", code: 101, userInfo: nil)
                    contentRepository.errorToReturn = testError

                    viewModel.fetchJokeList()

                    expect(try? viewModel.jokeList.value()).to(beEmpty())
                    expect(viewModel.error.value as? NSError).to(equal(testError))
                }
            }

            context("when showing joke detail") {
                it("should call coordinator's showJokeDetail(id)") {
                    let jokeID = 101

                    viewModel.showJokeDetail(jokeID: jokeID)

                    expect(coordinator.showJokeDetailCalled).to(beTrue())
                    expect(coordinator.showJokeDetailJokeID).to(equal(jokeID))
                }
            }
        }
    }
}

class MockJokeListCoordinator: JokeListCoordinator {
    var showJokeDetailCalled = false
    var showJokeDetailJokeID: Int?

    override func showJokeDetail(jokeID: Int) {
        showJokeDetailCalled = true
        showJokeDetailJokeID = jokeID
    }
}
