//
//  CityNameView.swift
//  WeatherForecastPM
//
//  Created by P.M. Class on 5/6/21.
//

import SwiftUI

struct CityNameView: View {
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
                Text(city)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                Text(date)
            }.foregroundColor(.black)
        }
    }
}

//struct CityNameView_previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
