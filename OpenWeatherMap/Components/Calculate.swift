import Foundation

class Calculate {

    static let shareInstance = Calculate()

    func switchCalculate(int: Int,temp: Double?) -> String {
        switch int {
        case 1:
            return calculateKelvinToCessasius(temp: temp)
        case 2:
            return calculateKelvinToFahrenheit(temp: temp)
        default: return ""
        }
    }

    func calculateKelvinToCessasius(temp: Double?) -> String {
        guard let T = temp else {
            return "E"
        }
        return String((T - 273.15).rounded(toPlaces: 10)) + " C"
    }

    func calculateKelvinToFahrenheit(temp: Double?) -> String {
        guard let T = temp else {
            return "E"
        }
        return String(((T - 273.15) * 1.8000 + 32.00).rounded(toPlaces: 10)) + " F"
    }

    func validateHumidity(humidity: Int?) -> String {
        guard let H = humidity else {
            return "E"
        }
        return String(H) + " %"
    }


}
