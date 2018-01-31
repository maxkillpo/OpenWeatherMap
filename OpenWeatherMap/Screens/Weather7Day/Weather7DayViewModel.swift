import RxSwift
import Service

class Weather7DayViewModel: BaseViewModel {

    func requestWeather(cityID: String?) -> Observable<WeahterResponseModel> {
        let service = WeatherService()
        guard let id = cityID else {
            return Observable.error(OpenWeatherMapError.responseErrorNon200)
        }
        return service.callService(request: WeahterRequestModel.init(id: id, cnt: "7"))
    }
}
