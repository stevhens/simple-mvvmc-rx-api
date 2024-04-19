import Alamofire
import RxSwift

class DefaultNetworkClient: NetworkClient {
    func fetchData<T: Decodable>(from urlString: String) -> Observable<T> {
        return Observable.create { observer in
            let disposable = AF.request(urlString)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        observer.onNext(data)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                }
            }
            
            return Disposables.create {
                disposable.cancel()
            }
        }
    }
}
