import RxSwift

protocol ContentRepository {
    func fetchJokeList() -> Observable<[Joke]>
    func fetchJoke(id: Int) -> Observable<Joke>
}
