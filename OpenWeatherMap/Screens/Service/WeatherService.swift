import RxSwift

class WeatherService: BaseService {

    func callService( request: WeahterRequestModel) -> Observable<WeahterResponseModel>  {
        return buildRequest(pathComponent: "forecast", params: request.toJSON())
            .map { json in
                try JsonMapper()
                    .jsonMapper(json.dictionaryObject)}
    }
}
