//
//  MoreButtonCell.swift
//  DetailingHomework
//
//  Created by alexander on 2.12.25.
//

import SwiftUI

struct MoreButtonCell: View {
    
    var iconName: String
    var iconSize: CGFloat = 20
    var frameSize: CGFloat = 40
    
    var body: some View {
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
    }
}

#Preview {
    MoreButtonCell(iconName: "ellipsis")
}
