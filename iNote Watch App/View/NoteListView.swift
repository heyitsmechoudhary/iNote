//
//  NoteDetailView.swift
//  iNote Watch App
//
//  Created by Rahul choudhary on 30/05/25.
//

import SwiftUI

struct NoteListView: View {
    //MARK: - PROPERTIES
    @AppStorage("linecount") var linecount: Int = 1
    @State var note: iNote
    //MARK: - BODY
    var body: some View {
        HStack{
            Capsule()
                .frame(width: 4)
                .foregroundColor(.accentColor)
            Text(note.text)
                .lineLimit(linecount)
                .padding(.leading,5)
        }
    }
}

//MARK: - PREVIEW
#Preview {
    let note = iNote(id: UUID(), text: "Test")
    NoteListView(note: note)
}
