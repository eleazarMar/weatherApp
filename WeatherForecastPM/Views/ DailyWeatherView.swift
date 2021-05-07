//
//   DailyWeatherView.swift
//  WeatherForecastPM
//
//  Created by P.M. Class on 5/7/21.
//

import SwiftUI

struct  DailyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        ForEach(cityVM.weather.daily) {
            weather in
            LazyVStack {
                dailyCell(weather: weather)
            }
        }
    }
    
    private func dailyCell(weather: DailyWeather) -> some View {
        HStack {
            Text(cityVM.getDayFor(timestamp: weather.dt).uppercased())
                .frame(width: 50)
            
            Spacer()
            
            Text("\(cityVM.getTempFor(temp: weather.temp.max)) | \(cityVM.getTempFor(temp: weather.temp.min)) °F")
                .frame(width: 150)
                Spacer()
            cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
        }
        .foregroundColor(.black)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color("ColorOne"), Color("ColorTwo")]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        .shadow(color: Color.green.opacity(0.8), radius: 2, x: -2, y: -2)
        .shadow(color: Color.green.opacity(0.8), radius: 2, x: 2, y: 2)
    }
}
