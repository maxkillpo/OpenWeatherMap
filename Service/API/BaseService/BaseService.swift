import RxSwift
import RxCocoa
import Alamofire

open class BaseService<Response: BaseResponseModel> {

    public init() {}

    func validateResponse(response: Response) throws -> Response { return response }

    func buildRequest(url: URLRequestConvertible) -> Observable<Response>  {
        return
            Manager.shareInstance.sessionURL(urlRequest: url)
                .map { dataResponse in
                    Logger.debug(dataResponse.request?.url)
                    Logger.debug(dataResponse.request?.allHTTPHeaderFields)
                    Logger.debug(dataResponse.result.value)
                    return try JsonMapper.shareInstance.mapper(dataResponse.result.value)
                }
                .map { response in
                    return try self.validateResponse(response: response)
                }
                .asObservable()
    }
}
