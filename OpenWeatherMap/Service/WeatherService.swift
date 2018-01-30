import RxSwift

class WeatherService: BaseService<WeahterResponseModel> {

    func callService( request: WeahterRequestModel) -> Observable<WeahterResponseModel>  {
        return buildRequest(pathComponent: "forecast", params: request.toJSON())
    }

}
