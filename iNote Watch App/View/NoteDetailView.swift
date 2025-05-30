//
//  NoteDetailView.swift
//  iNote Watch App
//
//  Created by Rahul choudhary on 30/05/25.
//

import SwiftUI

struct NoteDetailView: View {
    //MARK: - PROPERTIES
    
    
    let note: iNote
    let count:Int
    let index:Int
    
    @State private var isCreatingNote: Bool = false
    @State private var isSettingNote: Bool = false
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3){
            // 1. Header
            HeaderView(headerIcon: "note.text",title: "")
            
            // 2. Body
            Spacer()
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    
            }
            Spacer()
            
            // 3. Footer
            
            HStack(alignment: .center){
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingNote.toggle()
                    }
                    .sheet(isPresented: $isSettingNote, content: {
                        SettingView()
                    })
                
                Spacer()
                Text("\(count)/\(index+1)")
                Spacer()

                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreatingNote.toggle()
                    }
                    .sheet(isPresented: $isCreatingNote, content: {
                        CreditView() 
                    })
                
            }//: HSTACK
            .foregroundColor(.secondary)
            
        }//: VSTACK
        .padding(3)
    }
}
//MARK: - PREVIEW
#Preview {
    let note = iNote(id: UUID(), text: "Test")
    NoteDetailView(note: note,count: 5,index: 1)
}
