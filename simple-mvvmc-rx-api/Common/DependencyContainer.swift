import Foundation
import Swinject

class Dependency {
    static let container: Container = {
        var container: Container = Container()
        container = Dependency.registerDefaultServices(inContainer: container)
        container = Dependency.registerRepositories(inContainer: container)

        return container
    }()

    private static func registerDefaultServices(inContainer container: Container) -> Container {
        container.register(DefaultNetworkClient.self) { r -> DefaultNetworkClient in
            return DefaultNetworkClient()
        }.inObjectScope(.container)

        return container
    }

    private static func registerRepositories(inContainer container: Container) -> Container {
        container.register(DefaultContentRepository.self) { r -> DefaultContentRepository in
            let networkClient = r.resolve(DefaultNetworkClient.self)!
            return DefaultContentRepository(networkClient: networkClient)
        }.inObjectScope(.container)

        return container
    }
}
