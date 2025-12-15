//
//  SelectCarView.swift
//  DetailingHomework
//
//  Created by alexander on 2.12.25.
//

import SwiftUI

struct SelectCarView: View {
    
    let user = User.mock
    
    @State private var showSheet: Bool = false
    @State private var selectedBodyType: BodyType? = nil
    
    @State private var detent: PresentationDetent = .fraction(0.52)
    
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
                
                
                Text(user.name)
                
               
                Spacer()
            }
            .sheet(isPresented: $showSheet) {
                SelectCarSheetView()
                    .presentationCornerRadius(25)
                    .presentationDetents([detent])
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
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @State private var selectedCar: CarModel? = nil
    @State private var selectedBodyType: BodyType = .sedan
    
    let cars = CarModel.mocks
    
    var body: some View {
        
        VStack {
            header
                .padding(10)
            
            selectBodyTypeButtons
            
//           CarInfoCell(bodyType: selectedBodyType)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(cars, id: \.self) { car in
                        CarInfoCell(car: car, bodyType: car.bodyType)
                            .containerRelativeFrame(.horizontal, count: verticalSizeClass == .regular ? 1 : 1, spacing: 0)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.3)
                                    .scaleEffect(x: phase.isIdentity ? 1 : 0.8,
                                                 y: phase.isIdentity ? 1 : 0.8)
                            }
                            .onTapGesture {
                                selectedCar = car
                            }
                    }
                }
            }
            .scrollTargetBehavior(.paging)
            .frame(maxWidth: 800, maxHeight: 250)
//            .background(Color.red)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .sheet(item: $selectedCar) { car in
            ContentView(car: car)
        }
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
