//
//  SelectCarView.swift
//  DetailingHomework
//
//  Created by alexander on 2.12.25.
//

import SwiftUI

struct SelectCarView: View {
    
    @State private var showSheet: Bool = true
    @State private var selectedBodyType: BodyType? = nil
    private var car: CarModel = .mock
    
    var body: some View {
            VStack {
                topButtons
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Select Car")
                        .frame(width: 200, height: 50)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                Spacer()
            }
            .sheet(isPresented: $showSheet) {
                SelectCarSheetView()
                    .presentationCornerRadius(25)
                    .presentationDetents([.fraction(0.52)])
            }
        
        .background(
            Image("city.bckg")
                .resizable()
                .scaledToFit()
                .scaleEffect(5.5)
                .offset(y: -220)
                .opacity(0.7)
        )
    }
    
    private var topButtons: some View {
        HStack {
            MoreButtonCell(iconName: "line.3.horizontal.decrease")
            Spacer()
            MoreButtonCell(iconName: "dot.scope")
        }
    }
    

    
}

struct SelectCarSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedBodyType: BodyType = .sedan
    
    var body: some View {
            
            VStack {
                header
                    .padding(10)
                selectBodyTypeButtons
                CarInfoCell(bodyType: selectedBodyType)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
        //            .padding(.top, 7)
//            .background(
//                RoundedRectangle(cornerRadius: 25)
//                    .foregroundStyle(.white)
//                    .shadow(radius: 10)
//                )
            
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("Select a car")
                .fontWeight(.bold)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 20).bold())
                    .foregroundColor(.black)
                    .padding(15)
                    .offset(x: -5)
            }
        }
    }
    
    private var selectBodyTypeButtons: some View {
        ScrollView(.horizontal) {
            HStack (spacing: 8) {
                ForEach(BodyType.allCases, id: \.self) { bodyType in
                    CarBodyTypeCell(
                        title: bodyType.rawValue.capitalized,
                        isSelected: bodyType == selectedBodyType)
                        .onTapGesture {
                            selectedBodyType = bodyType
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
    }
    
}


#Preview {
    SelectCarView()
}
