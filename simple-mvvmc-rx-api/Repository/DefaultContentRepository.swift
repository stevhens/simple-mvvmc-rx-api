import RxSwift

class DefaultContentRepository: ContentRepository {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient = DefaultNetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchJokeList() -> Observable<[Joke]> {
        let url = "https://official-joke-api.appspot.com/jokes/ten"
        return networkClient.fetchData(from: url)
    }
}