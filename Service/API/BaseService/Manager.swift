import RxCocoa
import RxSwift
import Alamofire
import RxAlamofire
import SwiftyJSON

class Manager {

    static let shareInstance = Manager()

    func sessionURL(urlRequest: URLRequestConvertible) -> Observable<DataResponse<Any>>  {
        return RxAlamofire.request(urlRequest)
            .asObservable()
            .flatMap { dataRequest in return dataRequest.rx.responseJSON() }
            .timeout(RxTimeInterval(10.0), scheduler: MainScheduler.instance)
            .retry(RepeatBehavior.exponentialDelayed(maxCount: 3, initial: 1.0, multiplier: 1.0))
    }
}
