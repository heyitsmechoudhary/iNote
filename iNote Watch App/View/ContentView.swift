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
                
                HStack (alignment: .center, spacing: 6){
                    TextField("Add new Note ", text: $text)
                    Button{
                        // 1. Only run the button action code when the text field is not empty
                        // 2. Create a New note item and intialize it with the text value
                        // 3. Add the new note item to iNote array (by using Append)
                        // 4. Make the text field empty
                        // 5. Save the Note (Functions)
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42,weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
                }//: HSTACK
                Spacer()
            }//: VSTACK
            .navigationBarTitle("iNote")
        }
    }
}

//MARK: - PREVIEW
#Preview {
    ContentView()
}
