import UIKit

class JokeListCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let contentRepository = Dependency.container.resolve(DefaultContentRepository.self)!
        let viewModel = JokeListViewModel(contentRepository: contentRepository, coordinator: self)
        let viewController = JokeListViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showJokeDetail(jokeID: Int) {
        let coordinator = JokeDetailCoordinator(navigationController: navigationController, jokeID: jokeID)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}

extension JokeListCoordinator: JokeDetailCoordinatorDelegate {
    func jokeDetailCoordinatorDidFinish(_ coordinator: JokeDetailCoordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
