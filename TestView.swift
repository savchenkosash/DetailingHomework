//
//  TestView.swift
//  DetailingHomework
//
//  Created by alexander on 4.12.25.
//

import SwiftUI

struct TestView: View {
    
    @State var showSheet = false
    
    var body: some View {
        VStack {
            Text(showSheet ? "Sheet is not show" : "Sheet is shown")
            Button("Show Sheet") {
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet, content: {
            sheetView()
                .presentationDetents([.fraction(0.4)])
        })
    }
}

struct sheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
            Color.gray
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    TestView()
}


//.fraction(0.3) — 30% экрана
//
//.height(200) — фиксированная высота
//
//.medium
//
//.large


//.presentationDetents([.height(300)])
//.presentationDragIndicator(.visible)
