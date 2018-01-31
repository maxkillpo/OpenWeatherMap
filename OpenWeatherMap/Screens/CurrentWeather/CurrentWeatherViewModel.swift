import RxSwift
import Service

class CurrentWeatherViewModel: BaseViewModel {

    func requestWeather(cityID: String) -> Observable<WeahterResponseModel> {
        let service = WeatherService()
        return service.callService(request: WeahterRequestModel.init(id: cityID, cnt: "1"))
    }

}
