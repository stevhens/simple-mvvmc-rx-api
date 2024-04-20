import UIKit

protocol JokeDetailCoordinatorDelegate: AnyObject {
    func jokeDetailCoordinatorDidFinish(_ coordinator: JokeDetailCoordinator)
}

class JokeDetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    private let jokeID: Int
    weak var delegate: JokeDetailCoordinatorDelegate?
    
    init(navigationController: UINavigationController, jokeID: Int) {
        self.navigationController = navigationController
        self.jokeID = jokeID
    }
    
    func start() {
        let contentRepository = DefaultContentRepository()
        let viewModel = JokeDetailViewModel(contentRepository: contentRepository, coordinator: self)
        let viewController = JokeDetailViewController(viewModel: viewModel, jokeID: jokeID)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func dismissPage() {
        navigationController.popViewController(animated: true)
        delegate?.jokeDetailCoordinatorDidFinish(self)
    }
}
