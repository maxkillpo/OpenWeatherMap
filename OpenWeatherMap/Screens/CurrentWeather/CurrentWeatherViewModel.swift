import RxSwift
import Service

class CurrentWeatherViewModel: BaseViewModel {

    func requestWeather(cityID: String) -> Observable<WeahterResponseModel> {
        let service = WeatherService()
        return service.callService(request: WeahterRequestModel.init(id: cityID, cnt: "1"))
    }

    func displayTemp(temp: Double?) -> String {
        return Calculate.shareInstance.calculateKelvinToCessasius(temp: temp)
    }

    func displayHumidity(humidity: Int?) -> String {
        return Calculate.shareInstance.validateHumidity(humidity: humidity)
    }

}
