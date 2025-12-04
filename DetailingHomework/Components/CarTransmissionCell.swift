//
//  CarTransmissionCell.swift
//  DetailingHomework
//
//  Created by alexander on 2.12.25.
//

import SwiftUI

struct CarTransmissionCell: View {
    
    var title: String = "Automatic"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
            .themeColors(isSelected: isSelected)
            .cornerRadius(25)
            .overlay(
                 RoundedRectangle(cornerRadius: 25)
                    .stroke(isSelected ? Color.black : Color.gray.opacity(0.3), lineWidth: 2)
             )
    }
}

extension View {
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .black : .white)
            .foregroundStyle(isSelected ? .white : .black)
    }
}

#Preview {
    VStack {
        CarTransmissionCell(title: "Automatic")
        CarTransmissionCell(title: "Manual", isSelected: true)
        CarTransmissionCell(title: "Electric")
        CarTransmissionCell(title: "Hybrid")
    }
}

