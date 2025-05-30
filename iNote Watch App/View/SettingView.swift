//
//  SettingView.swift
//  iNote Watch App
//
//  Created by Rahul choudhary on 30/05/25.
//

import SwiftUI

struct SettingView: View {
    //MARK: - PROPERTIES
    @AppStorage("linecount") var linecount: Int = 1
    @State private var sliderValue: Double = 1
    
    //MARK: - FUNCTION
    func update(){
        linecount = Int(sliderValue)
    }
    
    //MARK: - BODY
    var body: some View {
        // HEADER
        // ACTUAL LINE COUNT
        VStack(spacing: 3) {
            // HEADER
            HeaderView(headerIcon: "note.text", title: "Setting")
            
            // ACTUAL LINE COUNT
            Text("Line Count: \(linecount)".uppercased())
                .fontWeight(.bold)
            
            
            // SLIDER
            Slider(value: Binding(get: {
                self.sliderValue
            }, set: {(newValue) in
                self.sliderValue = newValue
                self.update()
            }), in: 1...4,step: 1)
                .accentColor(.accentColor)
            
        }//: VSTACK
        // SLIDER
    }
}

//MARK: - PREVIEW
#Preview {
    SettingView()
}
