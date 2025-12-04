//
//  IconRowCell.swift
//  DetailingHomework
//
//  Created by alexander on 2.12.25.
//

import SwiftUI

struct IconRowCell: View {
    
    let car: Car = .mock
    var title: String
    var decription: String
    var iconName: String
    var iconSize: CGFloat = 20
    var frameSize: CGFloat = 40
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(alignment: .center, spacing: 2){
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .shadow(radius: 7)
                        .frame(width: frameSize, height: frameSize)
                        .padding(16)
                    Image(systemName: iconName)
                        .font(.system(size: iconSize).bold())
                        .padding(8)
                }
                
                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.bold)
                        
                    Text(decription)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}



#Preview {
    
    let car: Car = .mock
    
    VStack(spacing: 2) {
        IconRowCell(title: car.year, decription: "Year", iconName: "car.side")
        IconRowCell(title: car.color, decription: "Color", iconName: "bubbles.and.sparkles")
        IconRowCell(title: car.mileage, decription: "Mileage", iconName: "gauge.with.dots.needle.33percent")
        IconRowCell(title: car.power, decription: "Power up", iconName: "bolt.fill")
        IconRowCell(title: car.topSpeed, decription: "Top speed", iconName: "speedometer")
        IconRowCell(title: car.number, decription: "Number", iconName: "number")
        IconRowCell(title: car.owner, decription: "Car Driver", iconName: "person.fill")
        
    }
}

//"bubbles.and.sparkles"
//"gauge.with.dots.needle.33percent"
//"bolt.fill"
//"speedometer"
//"number"
//"person.fill"
