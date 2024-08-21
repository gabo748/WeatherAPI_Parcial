//
//  WeatherStates.swift
//  WeatherApp_Parcial1
//
//  Created by Gabriel Campos on 20/8/24.
//

import Foundation

enum WeatherStatesInfo: String, Decodable {
    case thunderstormWithLightRain = "thunderstorm with light rain"
    case thunderstormWithRain = "thunderstorm with rain"
    case thunderstormWithHeavyRain = "thunderstorm with heavy rain"
    case lightThunderstorm = "light thunderstorm"
    case thunderstorm = "thunderstorm"
    case heavyThunderstorm = "heavy thunderstorm"
    case raggedThunderstorm = "ragged thunderstorm"
    case thunderstormWithLightDrizzle = "thunderstorm with light drizzle"
    case thunderstormWithDrizzle = "thunderstorm with drizzle"
    case thunderstormWithHeavyDrizzle = "thunderstorm with heavy drizzle"
    case lightIntensityDrizzle = "light intensity drizzle"
    case drizzle = "drizzle"
    case heavyIntensityDrizzle = "heavy intensity drizzle"
    case lightIntensityDrizzleRain = "light intensity drizzle rain"
    case drizzleRain = "drizzle rain"
    case heavyIntensityDrizzleRain = "heavy intensity drizzle rain"
    case showerRainAndDrizzle = "shower rain and drizzle"
    case heavyShowerRainAndDrizzle = "heavy shower rain and drizzle"
    case showerDrizzle = "shower drizzle"
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case heavyIntensityRain = "heavy intensity rain"
    case veryHeavyRain = "very heavy rain"
    case extremeRain = "extreme rain"
    case freezingRain = "freezing rain"
    case lightIntensityShowerRain = "light intensity shower rain"
    case showerRain = "shower rain"
    case heavyIntensityShowerRain = "heavy intensity shower rain"
    case raggedShowerRain = "ragged shower rain"
    case lightSnow = "light snow"
    case snow = "snow"
    case heavySnow = "heavy snow"
    case sleet = "sleet"
    case lightShowerSleet = "light shower sleet"
    case showerSleet = "shower sleet"
    case lightRainAndSnow = "light rain and snow"
    case rainAndSnow = "rain and snow"
    case lightShowerSnow = "light shower snow"
    case showerSnow = "shower snow"
    case heavyShowerSnow = "heavy shower snow"
    case mist = "mist"
    case smoke = "smoke"
    case haze = "haze"
    case dust = "dust"
    case sand = "sand"
    case volcanicAsh = "volcanic ash"
    case squalls = "squalls"
    case tornado = "tornado"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
    case brokenClouds = "broken clouds"
    case overcastClouds = "overcast clouds"
    case rain = "rain"

    var code: String {
        switch self {
        case .clearSky:
            return "01d"
        case .fewClouds:
            return "02d"
        case .scatteredClouds:
            return "03d"
        case .brokenClouds, .overcastClouds:
            return "04d"
        case .showerRain, .lightIntensityShowerRain, .raggedShowerRain:
            return "09d"
        case .rain, .lightRain, .moderateRain, .heavyIntensityRain, .veryHeavyRain, .extremeRain, .heavyIntensityShowerRain:
            return "10d"
        case .thunderstorm, .lightThunderstorm, .thunderstormWithLightRain, .thunderstormWithRain, .thunderstormWithHeavyRain, .heavyThunderstorm, .raggedThunderstorm, .thunderstormWithLightDrizzle, .thunderstormWithDrizzle, .thunderstormWithHeavyDrizzle:
            return "11d"
        case .snow, .lightSnow, .heavySnow, .sleet, .lightShowerSleet, .showerSleet, .lightRainAndSnow, .rainAndSnow, .lightShowerSnow, .showerSnow, .heavyShowerSnow, .freezingRain:
            return "13d"
        case .mist, .smoke, .haze, .dust, .sand, .volcanicAsh, .squalls, .tornado:
            return "50d"
        case .lightIntensityDrizzle, .drizzle, .heavyIntensityDrizzle, .lightIntensityDrizzleRain, .drizzleRain, .heavyIntensityDrizzleRain, .showerRainAndDrizzle, .heavyShowerRainAndDrizzle, .showerDrizzle:
            return "09d"
        }
    }
}
