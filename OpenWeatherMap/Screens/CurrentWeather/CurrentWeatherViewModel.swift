import RxSwift

class CurrentWeatherViewModel: BaseViewModel {

    let thailandID = "1609350"

    func requestWeather(cityID: String) -> Observable<WeahterResponseModel> {
        let service = WeatherService()
        return service.callService(request: WeahterRequestModel.init(id: cityID, cnt: "1"))
    }

}
