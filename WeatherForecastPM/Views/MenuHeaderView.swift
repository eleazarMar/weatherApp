//
//  MenuHeaderView.swift
//  WeatherForecastPM
//
//  Created by P.M. Class on 5/6/21.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    @State private var searchTerm = "Tulsa"
    
    var body: some View {
        HStack {
            TextField("", text: $searchTerm)
                .padding(.leading, 20)
            
            Button {
                cityVM.city = searchTerm
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                    
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.green)
        .padding()
        .background(ZStack (alignment: .leading) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.black)
                .padding(.leading, 10)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black.opacity(0.8))
        })
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
