import Alamofire

enum Router : URLRequestConvertible {

    case forecast(parameters: Parameters)

    var method: HTTPMethod {
        switch self {
        case .forecast:
            return .get
        }

    }

    var path: String {
        switch self {
        case .forecast:
            return "forecast"
        }
    }

    var parameters: Parameters {
        switch self {
        case .forecast(let parameter):
            return parameter
        }
    }

}

extension Router {

    func asURLRequest() throws -> URLRequest {

        let baseURL = URL(string: "http://api.openweathermap.org/data/2.5")!
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        let urlComponents = NSURLComponents(url: url, resolvingAgainstBaseURL: true)!
        var queryItems = [URLQueryItem]()

        parameters.forEach { key,value in
            queryItems.append(URLQueryItem(name: key, value: String(describing: value)))
        }

        urlComponents.queryItems = queryItems
        request.url = urlComponents.url!
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }
}
