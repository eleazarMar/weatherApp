//
//  HourlyWeatherView.swift
//  WeatherForecastPM
//
//  Created by P.M. Class on 5/7/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(cityVM.weather.hourly) {
                    weather in
                    let icon = cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hour = cityVM.getTimeFor(timestamp: weather.dt)
                    let temp = cityVM.getTempFor(temp: weather.temp)
                    getHourlyView(hour: hour, image: icon, temp: temp)
                }
            }
        }
    }
    
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 20) {
            Text(hour)
            image.foregroundColor(.yellow)
            Text(temp)
        }
        .foregroundColor(.black)
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.green.opacity(0.8), radius: 2, x: -2, y: -2)
        .shadow(color: Color.green.opacity(0.8), radius: 2, x: 2, y: 2)
    }
}

