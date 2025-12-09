//
//  CarInfoCell.swift
//  DetailingHomework
//
//  Created by alexander on 3.12.25.
//

import SwiftUI

struct CarInfoCell: View {
    
    var car: CarModel = .mock
    var bodyType: BodyType?
    var imageSize: CGFloat = 150
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                carPower
                carPowerIcons
            }
            .padding(7)
            
            Text(car.model)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .frame(alignment: .leading)
//                .background(Color.red)

            Image(bodyType?.imageName(style: .side) ?? "carimage.side")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: imageSize)
                .padding(.horizontal, 10)
                .offset(y: -10)
//                .scaledToFit()
//                .scaleEffect(1.2)
//                .padding(.leading, 75)
//                .background(Color.red)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(25)
        .padding(5)
        
//        .background(Color.blue)
        
    }
    
    private var carPower: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text("172 kW")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("/ps")
                .font(.callout)
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var carPowerIcons: some View {
        HStack(spacing: 0) {
            HStack {
                Image(systemName: "fuelpump.fill")
                Text("10.9")
                    .font(.caption)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
            }
            .padding(5)
            .foregroundColor(.gray)
            .background(
                 RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.white)
             )
            .frame(width: 80, height: 40)
            
            
            HStack {
                Image(systemName: "figure.run")
                Text("10.9")
                    .font(.caption)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
            }
            .padding(5)
            .foregroundColor(.gray)
            .background(
                 RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.white)
             )
            .frame(width: 80, height: 40)
        }
    }
    
    
}

#Preview {
    VStack {
        CarInfoCell(bodyType: .coupe)
        CarInfoCell(bodyType: .convertible)

    }
}
