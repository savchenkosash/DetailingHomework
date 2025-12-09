//
//  ContentView.swift
//  DetailingHomework
//
//  Created by alexander on 2.12.25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let car: CarModel
//    var bodyType: BodyType?
    
    var body: some View {
        ZStack {
            VStack {
                navigationBar
                ScrollView {
                    header
                    mainInfo
                }
                .padding(.leading)
                    footer
            }
        }
        
        .background(Image(car.bodyType.imageName(style: .top))

            .scaledToFill()
            .scaleEffect(0.42)
            .offset(x: 200, y: 10)
                
//        .background(Image("coupeBckg")
//            .resizable()
//            .scaleEffect(1.1)
//            .offset(x: 180, y: 30)
//            .background(Color.red)
        )
    }
    
    
    private var navigationBar: some View {
        ZStack {
            Text("Car info")
                .fontWeight(.bold)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .center)
            MoreButtonCell(iconName: "ellipsis")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .background(Color.white)
    }
    
    private var header: some View {
        VStack(spacing: 10) {
//            Text(car.className)
//                .font(.subheadline)
//                .foregroundStyle(.secondary)
//                .frame(maxWidth: .infinity, alignment: .leading)
            Text(car.model)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var mainInfo: some View {
        VStack(spacing: 0) {
            IconRowCell(title: "\(car.year)", decription: "Year", iconName: "car.side")
            IconRowCell(title: car.color ?? "Red", decription: "Color", iconName: "bubbles.and.sparkles")
            IconRowCell(title: (car.mileage.map { "\($0)" } ?? "—"), decription: "Mileage", iconName: "gauge.with.dots.needle.33percent")
            IconRowCell(title: car.licensePlate ?? "001AA1", decription: "Number", iconName: "number")

//            IconRowCell(title: car.power, decription: "Power up", iconName: "bolt.fill")
//            IconRowCell(title: car.topSpeed, decription: "Top speed", iconName: "speedometer")
//            IconRowCell(title: car.owner, decription: "Car Driver", iconName: "person.fill")
        }
    }
    
    private var footer: some View {
        HStack {
            VStack(spacing: 2) {
                Text("234 UAH")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Reserve for full day")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Button(action: {}) {
                Text("Order Now")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 130, height: 50)
                    .background(Color.black)
                    .cornerRadius(23)
            }
        }
        .padding(.all, 25)
    }
    
}

#Preview {
    ContentView(car: .mock)
}
