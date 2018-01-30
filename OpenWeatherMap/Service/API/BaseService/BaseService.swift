import RxSwift
import RxCocoa
import SwiftyJSON

class BaseService<Response: BaseResponseModel> {

    private let baseURL = URL(string: "http://api.openweathermap.org/data/2.5")!
    private let session = URLSession.shared

    func buildRequest(method: String = "GET", pathComponent: String, params: [String: Any]) -> Observable<Response> {

        let url = baseURL.appendingPathComponent(pathComponent)
        var request = URLRequest(url: url)
        let urlComponents = NSURLComponents(url: url, resolvingAgainstBaseURL: true)!
        var queryItems = [URLQueryItem]()

        params.forEach { key,value in
            queryItems.append(URLQueryItem(name: key, value: String(describing: value)))
        }

        urlComponents.queryItems = queryItems
        request.url = urlComponents.url!
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return session.rx.data(request: request)
            .map { data in
                return try JSON(data: data)
            }
            .map { json in
                let jsonMapper = JsonMapper()
                return try jsonMapper.mapper(json.dictionaryObject)
        }
    }
}
