//
//  ContentView.swift
//  iNote Watch App
//
//  Created by Rahul choudhary on 06/05/25.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var note:[iNote] = [iNote]()
    @State private var text:String = ""
    //MARK: - FUNCTION
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Hello, world")
            }//: VSTACK
            .navigationBarTitle("iNote")
        }
    }
}

//MARK: - PREVIEW
#Preview {
    ContentView()
}
