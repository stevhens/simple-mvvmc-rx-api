import Quick
import Nimble
import RxSwift
import RxCocoa
import UIKit
@testable import simple_mvvmc_rx_api

class JokeListViewControllerSpec: QuickSpec {
    override class func spec() {
        describe("JokeListViewController") {
            var sut: JokeListViewController!
            var mockViewModel: MockJokeListViewModel!
            var mockContentRepository: MockContentRepository!
            var coordinator: JokeListCoordinator!
            
            beforeEach {
                mockContentRepository = MockContentRepository()
                coordinator = JokeListCoordinator(navigationController: .init())
                mockViewModel = MockJokeListViewModel(contentRepository: mockContentRepository, coordinator: coordinator)
                sut = JokeListViewController(viewModel: mockViewModel)
                _ = sut.view
            }
            
            context("when initialized from coder") {
                it("should raise a fatal error") {
                    expect {
                        _ = JokeDetailViewController(coder: NSCoder())
                    }.to(throwAssertion())
                }
            }
            
            context("when view is loaded") {
                it("should have title") {
                    expect(sut.navigationItem.title).to(equal("Jokes"))
                }
                
                it("should bind view model and fetch joke list") {
                    expect(mockViewModel.fetchJokeListCalled).to(beTrue())
                }
            }
            
            context("when joke list is received") {
                it("should display data in cells") {
                    let mockJokes = [
                        Joke(id: 1, type: "type1", setup: "setup1", punchline: "punchline1"),
                        Joke(id: 2, type: "type2", setup: "setup2", punchline: "punchline2"),
                    ]
                    mockViewModel.jokeList.onNext(mockJokes)
                    expect(sut.collectionView.numberOfItems(inSection: 0)).to(equal(mockJokes.count))
                    
                    sut.view.layoutIfNeeded()
                    
                    for (index, joke) in mockJokes.enumerated() {
                        let indexPath = IndexPath(item: index, section: 0)
                        let cell = sut.collectionView.cellForItem(at: indexPath) as! JokeListItemCell
                        expect(cell.jokeSetupLabel.text).to(equal(joke.setup))
                        expect(cell.jokePunchlineLabel.text).to(equal(joke.punchline))
                    }
                }
            }
            
            context("when a collection view cell is selected") {
                it("should trigger showJokeDetail(id)") {
                    let indexPath = IndexPath(item: 0, section: 0)
                    let mockJokes = [
                        Joke(id: 1, type: "type1", setup: "setup1", punchline: "punchline1"),
                        Joke(id: 2, type: "type2", setup: "setup2", punchline: "punchline2"),
                    ]
                    mockViewModel.jokeList.onNext(mockJokes)
                    expect(sut.collectionView.numberOfItems(inSection: 0)).to(equal(mockJokes.count))

                    sut.view.layoutIfNeeded()
                    
                    sut.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
                    
                    mockViewModel.showJokeDetail(jokeID: 1)
                    expect(mockViewModel.showJokeDetailCalled).toEventually(beTrue(), timeout: .seconds(2))
                    expect(mockViewModel.selectedJokeID).toEventually(equal(mockJokes[indexPath.item].id), timeout: .seconds(2))
                }
            }
        }
    }
}

class MockJokeListViewModel: JokeListViewModel {
    var fetchJokeListCalled = false
    var showJokeDetailCalled = false
    var selectedJokeID: Int?
    
    override func fetchJokeList() {
        fetchJokeListCalled = true
    }
    
    override func showJokeDetail(jokeID: Int) {
        showJokeDetailCalled = true
        selectedJokeID = jokeID
    }
}
