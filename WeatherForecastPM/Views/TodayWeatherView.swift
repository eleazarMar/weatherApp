//
//  TodayWeatherView.swift
//  WeatherForecastPM
//
//  Created by P.M. Class on 5/6/21.
//

import SwiftUI

struct TodayWeatherView: View  {
    @ObservedObject var cityVM: CityViewViewModel
    var body: some View {
        VStack(spacing: 10) {
            Text("Today")
                .font(.largeTitle)
                .bold()
            
            HStack(spacing: 20) {
                LottieView(name: cityVM.getLottieAnimation(icon: cityVM.weatherIcon))
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text("\(cityVM.temperature)°F")
                        .font(.system(size: 42))
                    Text(cityVM.conditions)
                }
            }
            
            HStack {
                Spacer()
                widgetView(image: "wind" ,color: .black, title: "\(cityVM.windSpeed)mi/hr")
                Spacer()
                widgetView(image: "drop.fill", color: .black, title: "\(cityVM.humidity)")
                Spacer()
                widgetView(image: "umbrella.fill" ,color: .black, title: "\(cityVM.rainChances)")
                Spacer()
            }
        }
        
        .padding()
        .foregroundColor(.black)
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.green.opacity(0.8), radius: 2, x: -2, y: -2)
        .shadow(color: Color.green.opacity(0.8), radius: 2, x: 2, y: 2)
    }
    
    private func widgetView(image: String, color: Color, title: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            
            Text(title)
        }
    }
}

//struct TodayWeatherView_Preview: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
