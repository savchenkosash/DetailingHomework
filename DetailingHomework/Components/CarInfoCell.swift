//
//  CarInfoCell.swift
//  DetailingHomework
//
//  Created by alexander on 3.12.25.
//

import SwiftUI

struct CarInfoCell: View {
    
    var carImageSide: String = "carimage.side"
    var car: Car = .mock
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                carPower
                carPowerIcons
            }
            .padding(7)
            
            Image(carImageSide)
                .resizable()
                .scaledToFit()
                .padding(10)
            
            Text(car.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(25)
        .padding(5)
    }
    
    private var carPower: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text("\(car.power) kW")
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
    CarInfoCell()
}
