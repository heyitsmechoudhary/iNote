//
//  CreditView.swift
//  iNote Watch App
//
//  Created by Rahul choudhary on 30/05/25.
//

import SwiftUI

struct CreditView: View {
    //MARK: - PROPERTIES
    let num = Int.random(in: 1..<4)
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3){
            // 1. PROFIFLE
            
            // 2. HEADER
            Image("developer-no\(num)")
                .resizable()
                .scaledToFit()
            HeaderView(headerIcon: "note.text", title: "Credits")
            Text("Rahul Choudhary")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            Text("Software Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
            // 3. CONTENT
            
        }
    }
}

//MARK: - PREVIEW
#Preview {
    CreditView()
}
