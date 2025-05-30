//
//  ContentView.swift
//  iNote Watch App
//
//  Created by Rahul choudhary on 06/05/25.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    
    @State private var notes:[iNote] = [iNote]()
    @State private var text:String = ""
    //MARK: - FUNCTION
    
    func getDocumentDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func save(){
        // dump(notes)
        do{
            // 1. Convert the notes array into Using JSONencoder
            let data  = try JSONEncoder().encode(notes)
            // 2. Create a new URL to save the file using the getDocumentDirectory
            let URL = getDocumentDirectory().appendingPathComponent("iNotes.json")
            // 3. write the data to given URL
            try data.write(to: URL)
            print("Saving Data Successfully")
        }catch{
            print("Saving Data Failed")
        }
    }
    
    func loadData(){
        DispatchQueue.main.async {
            do{
                // 1. Get the notes URL Path
                let URL = getDocumentDirectory().appendingPathComponent("iNotes.json")
                // 2. Craete a new Property for the Data
                let data = try Data(contentsOf: URL)
                // 3. Decode the data
                notes = try JSONDecoder().decode([iNote].self, from: data)
            }catch{
                // Do nothing
            }
        }
    }
    
    func delete(offsets:IndexSet){
        withAnimation{
            notes.remove(atOffsets:offsets)
            save()
        }
    }
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                
                HStack (alignment: .center, spacing: 6){
                    TextField("Add new Note ", text: $text)
                    Button{
                        // 1. Only run the button action code when the text field is not empty
                        guard text.isEmpty == false else { return }
                        // 2. Create a New note item and intialize it with the text value
                        let note = iNote(id: UUID(), text: text)
                        // 3. Add the new note item to iNote array (by using Append)
                        notes.append(note)
                        // 4. Make the text field empty
                        text = ""
                        // 5. Save the Note (Functions)
                        save()
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
                if notes.count >= 1 {
                    List{
                        ForEach(0 ..< notes.count, id: \.self){ index in
                            NavigationLink(destination: NoteDetailView(note: notes[index], count: notes.count, index: index)) {
                                NoteListView(note: notes[index])
                            }
                        }//: LOOP
                        .onDelete(perform: delete)
                    }//: LIST
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            }//: VSTACK
            .navigationBarTitle("iNote")
            .onAppear(perform: {
                loadData()
            })
        }
    }
}

//MARK: - PREVIEW
#Preview {
    ContentView()
}
