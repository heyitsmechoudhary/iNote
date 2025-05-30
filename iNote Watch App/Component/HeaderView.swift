//
//  HeaderView.swift
//  iNote Watch App
//
//  Created by Rahul choudhary on 30/05/25.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - PROPERTIES
    let headerIcon: String 
    let title : String
    //MARK: - BODY
    var body: some View {
        if title != "" {
            VStack(alignment: .leading){
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
        }
        
        HStack{
            Capsule()
                .frame(height: 1)
            Image(systemName: headerIcon)
            Capsule()
                .frame(height: 1)
        }//: HSTACK
        .foregroundColor(.accentColor)
    }
}

//MARK: - PREVIEW
#Preview {
    Group {
        
        HeaderView(headerIcon: "note.text",title: "Credits")
    }
}
