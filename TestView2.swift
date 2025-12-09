//
//  TestView2.swift
//  DetailingHomework
//
//  Created by alexander on 9.12.25.
//

import SwiftUI

struct TestView2: View {
    
    let car: Car
    
    var body: some View {
        Text(car.name)
    }
}

#Preview {
    TestView2(car: .mock)
}
